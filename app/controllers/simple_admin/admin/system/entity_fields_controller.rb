module SimpleAdmin
  module Admin
    module System
      class EntityFieldsController < SimpleAdmin::Admin::ApplicationController
        include ResourceController::CrudifyDynamicResource

        def model_klass
          SimpleAdmin::EntityField
        end

        private

          def resource_params
            params.require(:simple_admin_entity_field).permit(:name, :label, :entity_field_type_id, :entity_id, :presentation,
                                                              :search_indexable, entity_field_setting_attributes: [:value])
          end
      end
    end
  end
end
