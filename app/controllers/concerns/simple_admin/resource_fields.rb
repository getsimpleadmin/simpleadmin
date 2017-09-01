module SimpleAdmin
  module ResourceFields
    extend ActiveSupport::Concern

    included do
      before_action :initialize_fields_entities!

      def initialize_fields_entities!
        @entity = SimpleAdmin::Entity.find_by(model_klass_name: model_klass.to_s)
        @entity_fields = @entity.entity_fields.where(presentation: field_presentation)
      end

      private

      def field_presentation
        case params[:action]
        when 'index'
          :collection
        when 'new'
          :form
        when 'create'
          :form
        when 'edit'
          :form
        end
      end

      def resource_name
        model_klass.model_name.singular
      end

      def resource_attributes
        SimpleAdmin::Entity.form_attributes(model_klass)
      end
    end
  end
end
