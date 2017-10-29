module SimpleAdmin
  module Admin
    module System
      class UserRolesController < SimpleAdmin::Admin::ApplicationController
        include ResourceController::Crudify

        def model_klass
          SimpleAdmin::Role
        end

        def after_create_path
          admin_system_user_roles_path
        end

        def after_update_path
          admin_system_user_roles_path
        end

        def after_destroy_path
          admin_system_user_roles_path
        end

        private

          def resource_params
            params.require(:simple_admin_user_role).permit(:name)
          end
      end
    end
  end
end
