module SimpleAdmin
  class Entity < Base
    include Helpers::BooleanHelper

    boolean_fields :status

    has_many :entity_fields

    scope :enabled, -> { where(status: true) }

    validates :model_klass_name, presence: true

    before_save :label_default_value!
    after_create :create_default_fields!

    after_save :reload_routes! unless Rails.env.test?

    class << self
      def form_attributes(model_klass)
        find_by(model_klass_name: model_klass.to_s).entity_fields.form.pluck(:name)
      end

      def resource_attributes
        enabled.map do |entity|
          [entity.model_klass.model_name.collection, entity.model_klass_name]
        end
      end
    end

    def model_klass
      model_klass_name.constantize
    end

    private

      def reload_routes!
        Rails.application.routes_reloader.reload!
      end

      def label_default_value!
        return if label.present?
        self.label = model_klass.model_name.human.pluralize
      end

      def create_default_fields!
        SimpleAdmin::EntityFieldType.reload_helper_methods!
        SimpleAdmin::EntityField.create_number_field(name: :id, label: '#', entity: self, presentation: :collection)
      end
  end
end
