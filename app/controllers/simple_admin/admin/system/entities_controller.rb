module SimpleAdmin
  module Admin
    module System
      class EntitiesController < SimpleAdmin::Admin::ApplicationController
        include ResourceController::Crudify

        authorize_resource class: SimpleAdmin::Entity

        before_action :reload_models!, only: %i[new edit]

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
            params.require(:simple_admin_entity).permit(:model_klass_name, :model_plural_name, :label, :status)
          end

          def reload_models!
            Rails.application.eager_load!
          end
      end
    end
  end
end
