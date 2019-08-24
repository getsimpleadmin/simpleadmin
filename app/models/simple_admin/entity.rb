# frozen_string_literal: true

class SimpleAdmin::Entity < SimpleAdmin::Base
  extend FriendlyId
  friendly_id :model_klass_name, use: :slugged

  belongs_to :project

  has_many :entity_fields, dependent: :destroy
  has_many :widgets,       dependent: :destroy

  scope :enabled, -> { where(status: true) }

  validates :model_klass_name, presence: true
  validate :label_uniqueness, :model_klass_name_uniqueness

  before_save :label_default_value!, :icon_default_value!

  def form_fields?
    entity_fields.form.any?
  end

  def searchable?
    entity_fields.collection.where(search_indexable: true).any?
  end

  def enabled?
    status
  end

  private

  def label_default_value!
    return if label.present?

    self.label = model_klass_name.pluralize.capitalize
  end

  def icon_default_value!
    return if icon.present?

    self.icon = 'si si-layers'
  end

  def label_uniqueness
    duplicate = project.entities.find_by(label: label)

    errors.add(:label, "You've already used this label") if duplicate.present? && duplicate != self
  end

  def model_klass_name_uniqueness
    duplicate = project.entities.find_by(model_klass_name: model_klass_name)

    errors.add(:model_klass_name, "You've already used this model") if duplicate.present? && duplicate != self
  end
end
