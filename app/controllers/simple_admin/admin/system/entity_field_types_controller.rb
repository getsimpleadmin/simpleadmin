module SimpleAdmin
  module Admin
    module System
      class EntityFieldTypesController < BaseController
        include SimpleAdmin::ResourceCrud

        authorize_resource class: SimpleAdmin::Entity

        def model_klass
          SimpleAdmin::EntityFieldType
        end

        def after_create_path
          admin_system_entity_field_types_path
        end

        def after_update_path
          admin_system_entity_field_types_path
        end

        def after_destroy_path
          admin_system_entity_field_types_path
        end

        private

        def resource_params
          params.require(:simple_admin_entity_field_type).permit(:name, :template)
        end

        def template_path(controller_action=nil)
          "#{params[:controller]}/#{params[:action]}"
        end
      end
    end
  end
end
