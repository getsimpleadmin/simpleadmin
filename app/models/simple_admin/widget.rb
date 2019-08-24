# frozen_string_literal: true

class SimpleAdmin::Widget < SimpleAdmin::Base
  enum width: %w[col-12 col-6 col-4 col-3]

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :widget_category

  belongs_to :project
  belongs_to :entity

  validates :name, presence: true

  scope :latest, -> { order(sort_order: :asc) }

  before_save :icon_default_value!

  def enabled?
    status
  end

  validate :name_uniqueness

  private

  def icon_default_value!
    return if icon.present?

    self.icon = 'si si-layers'
  end

  def name_uniqueness
    duplicate = project.widgets.find_by(name: name, widget_category: widget_category)

    errors.add(:name, 'you already have the same widget') if duplicate.present? && duplicate != self
  end
end
