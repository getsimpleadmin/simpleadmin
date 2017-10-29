module SimpleAdmin
  module Admin
    module System
      class UserPermissionsController < SimpleAdmin::Admin::ApplicationController
        include ResourceController::CrudifyDynamicResource

        def model_klass
          SimpleAdmin::UserPermission
        end

        private

          def resource_params
            params.require(:simple_admin_user_permission).permit(:action, :action_modificator, :model_klass_name, :role_id)
          end
      end
    end
  end
end
