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
    scope :labels, -> { latest.pluck(:label) }

    scope :search_indexable_columns, -> { collection.where(search_indexable: true).pluck(:name) }

    before_save :label_default_value!

    def id_field?
      name == 'id'
    end

    # Entity association class for field
    # @example SimpleAdmin::Post
    #   module SimpleAdmin
    #     class Post < Base
    #       belongs_to :category, optional: true
    #     end
    #   end
    #
    #   entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Post.to_s)
    #   entity_field_type = SimpleAdmin::EntityFieldType.create(name: :relation, template: 'simple_admin/fields/relation')
    #
    #   entity_field = SimpleAdmin::EntityField.new(name: :category_id, label: 'Category',
    #                                                                   entity_field_type: entity_field_type, entity: entity)
    #   entity_field.association_klass
    #
    #   SimpleAdmin::Category
    #
    # @return [ActiveRecord Class]
    #
    # @since 0.1.0-alpha
    def association_klass
      model_instance = entity.model_klass.new
      association_name = name.remove('_id')

      model_instance.public_send("build_#{association_name}").class
    end

    # Template path for field
    #
    # @return [String]
    #
    # @since 0.1.0-alpha
    def template_path
      "#{entity_field_type.template}/#{presentation}"
    end

    def already_exists?
      self.class.where(name: name, presentation: presentation, entity: entity).any?
    end

    private

      def label_default_value!
        return if id_field? || label.present?
        self.label = name.camelize
      end

      def name_presentation_uniqueness
        errors.add(:name, 'already exists') if already_exists?
      end
  end
end
