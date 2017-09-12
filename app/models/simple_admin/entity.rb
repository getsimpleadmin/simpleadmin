module SimpleAdmin
  class Entity < Base
    using Refinements::Boolean

    has_many :entity_fields

    validate :inbuilt_protection, on: :destroy

    scope :custom_enabled, -> { where(inbuilt: false, status: true) }

    after_create :create_default_fields!

    unless Rails.env.test?
      after_save :reload_routes!
    end

    def model_klass
      model_klass_name.constantize
    end

    def status_humanized
      status.humanize
    end

    def inbuilt_humanized
      inbuilt.humanize
    end

    def inbuilt?
      inbuilt
    end

    def enum_field_keys(field_name)
      model_klass_name.constantize.public_send(field_name.pluralize).keys
    end

    def self.form_attributes(model_klass)
      find_by(model_klass_name: model_klass.to_s).entity_fields.form.pluck(:name)
    end

    private

      def inbuilt_protection
        if inbuilt?
          errors.add(:inbuilt, 'protection')
        end
      end

      def create_default_fields!
        SimpleAdmin::EntityFieldType.reload_helper_methods!
        SimpleAdmin::EntityField.create_number_field(name: :id, label: 'ID', entity: self, presentation: :collection)
      end

      def reload_routes!
        Rails.application.routes_reloader.reload!
      end
  end
end
