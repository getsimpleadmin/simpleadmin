# frozen_string_literal: true

class SimpleAdmin::EntityField < SimpleAdmin::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  enum presentation: %i[collection form]

  belongs_to :entity, optional: true
  has_one :entity_field_type, primary_key: :entity_field_type_id, foreign_key: :id

  validates_with EntityFieldValidator
  validate :name_presentation_uniqueness, on: :create

  scope :latest, -> { order(sort_order: :asc) }
  scope :labels, -> { latest.pluck(:label) }

  scope :search_indexable_columns, -> { collection.where(search_indexable: true).pluck(:name) }

  before_save :label_default_value!
  before_create :sort!

  def self.names_with_types
    joins(:entity_field_type).pluck('simple_admin_entity_field_types.name', :name).map do |field_type, field_name|
      {
        field_name: field_name,
        field_type: field_type
      }
    end
  end

  def id_field?
    name == 'id'
  end

  def sortable?
    sorting
  end

  def number?
    entity_field_type.name == 'number'
  end

  def image?
    entity_field_type.name == 'image'
  end

  def template_path
    "#{entity_field_type.template}/#{presentation}"
  end

  private

  def sort!
    self.sort_order = entity.entity_fields.where(presentation: presentation).count + 1
  end

  def label_default_value!
    return if label.present?

    self.label = name.camelize
  end

  def name_presentation_uniqueness
    errors.add(:name, 'already exists') if already_exists?
  end

  def already_exists?
    self.class.where(name: name, presentation: presentation, entity: entity).any?
  end
end
