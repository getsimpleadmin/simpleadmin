module SimpleAdmin
  module ResourceFields
    extend ActiveSupport::Concern

    included do
      before_action :initialize_entity_fields, if: :enable_entity_fields?

      private

      def initialize_entity_fields
        @entity_fields = entity.entity_fields.where(display: entity_field_display)
      end

      private

      def entity
        @entity ||= SimpleAdmin::Entity.find_by(model_plural_name: controller_entity_name)
      end

      def entity_field_display
        case params[:action]
        when 'index'
          :index
        when 'new'
          :form
        when 'edit'
          :form
        end
      end

      def controller_entity_name
        self.class.name.gsub(/(^(.+?)::Admin::|Controller)/, '').underscore
      end

      def enable_entity_fields?
        enable_entity_fields
      end
    end
  end
end
