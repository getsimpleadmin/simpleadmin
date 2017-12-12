module SimpleAdmin
  module Admin
    module System
      class EntitiesController < SimpleAdmin::Admin::ApplicationController
        include ResourceController::Crudify

        def model_klass
          SimpleAdmin::Entity
        end

        def after_create_path
          edit_admin_system_entity_path(@resource)
        end

        def after_update_path
          admin_system_entities_path
        end

        def after_destroy_path
          admin_system_entities_path
        end

        private

          def resource_params
            params.require(:simple_admin_entity).permit(:model_klass_name, :label, :status)
          end
      end
    end
  end
end
