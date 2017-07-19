module Admin
  class EntityFieldTypesController < BaseController
    include SimpleAdmin::InbuiltControllerSettings
    include SimpleAdmin::CrudControllerHelper

    def model_klass
      SimpleAdmin::EntityFieldType
    end

    def redirect_path
      admin_entity_field_types_path
    end

    private

    def resource_params
      params.require(:simple_admin_entity_field_type).permit(:name, :template)
    end
  end
end
