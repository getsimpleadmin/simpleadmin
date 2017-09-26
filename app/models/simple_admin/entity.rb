module SimpleAdmin
  class Entity < Base
    include Helpers::BooleanHelper

    boolean_fields :status, :inbuilt

    has_many :entity_fields

    scope :custom_enabled, -> { where(inbuilt: false, status: true) }

    validates :model_klass_name, presence: true

    before_destroy :validate_inbuilt

    after_create :create_default_fields!

    unless Rails.env.test?
      after_save :reload_routes!
    end

    class << self
      def form_attributes(model_klass)
        find_by(model_klass_name: model_klass.to_s).entity_fields.form.pluck(:name)
      end

      def resource_attributes
        custom_enabled.map do |entity|
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

      def create_default_fields!
        SimpleAdmin::EntityFieldType.reload_helper_methods!
        SimpleAdmin::EntityField.create_number_field(name: :id, label: '#', entity: self, presentation: :collection)
      end

      def validate_inbuilt
        if inbuilt?
          errors.add(:base, 'Can not delete system entity') and throw :abort
        end
      end
  end
end
