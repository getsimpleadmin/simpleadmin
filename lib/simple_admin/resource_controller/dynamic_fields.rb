module SimpleAdmin
  module ResourceController
    module DynamicFields
      # Concern that include methods for getting entity and entity fields
      # Working together with ResourceCrud
      # @example PostsController with ResourceCrud and ResourceFields
      #  class PostsController
      #    include ResourceController::Crudify
      #    include SimpleAdmin::ResourceFields
      #
      #    ...
      #  end
      # @since 0.1.0-alpha

      extend ActiveSupport::Concern

      included do
        before_action :initialize_fields_entities!

        # Receives entity and entity fields by model class and field_presentation
        #
        # @since 0.1.0-alpha
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

          def resource_params_name
            model_klass.model_name.singular
          end

          def resource_attributes
            SimpleAdmin::Entity.form_attributes(model_klass)
          end
      end
    end
  end
end
