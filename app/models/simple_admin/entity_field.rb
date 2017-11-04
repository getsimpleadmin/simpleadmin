module SimpleAdmin
  class EntityField < Base
    enum presentation: %i[collection form]

    belongs_to :entity

    has_one :entity_field_type, primary_key: :entity_field_type_id, foreign_key: :id
    has_one :entity_field_setting, dependent: :destroy

    accepts_nested_attributes_for :entity_field_setting, update_only: true
    delegate :value, to: :entity_field_setting, allow_nil: true

    validate :name_presentation_uniqueness, on: :create

    scope :latest, -> { order(created_at: :asc) }

    before_create :set_label_default_value!

    def self.labels
      latest.pluck(:label)
    end

    def id_field?
      name == 'id'
    end

    def association_klass
      model_instance = entity.model_klass.new
      association_name = name.remove('_id')

      model_instance.public_send("build_#{association_name}").class
    end

    def template_path
      "#{entity_field_type.template}/#{presentation}"
    end

    private

    def set_label_default_value!
      return if id_field? || label.present?
      self.label = name.camelize
    end

    def name_presentation_uniqueness
      if field_already_exists?
        errors.add(:name, 'already exists')
      end
    end

    def field_already_exists?
      self.class.where(name: name, presentation: presentation, entity: entity).any?
    end
  end
end
