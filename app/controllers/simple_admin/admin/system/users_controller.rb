module SimpleAdmin
  module Admin
    module System
      class UsersController < SimpleAdmin::Admin::ApplicationController
        include ResourceController::Crudify

        def create
          @resource =
            if defined?(resource_modificator)
              resource_modificator.build(resource_params)
            else
              model_klass.new(resource_params)
            end

          if @resource.save
            redirect_to after_create_path, notice: t('simple_admin.resource.create.success', resource_name: resource_name)
          else
            render :new
          end
        end

        def model_klass
          SimpleAdmin::User
        end

        def after_create_path
          admin_system_users_path
        end

        def after_update_path
          admin_system_users_path
        end

        def after_destroy_path
          admin_system_users_path
        end

        private

          def resource_params
            params.require(:simple_admin_user).permit(:email, :password, :password_confirmation,
                                                      profile_attributes: %i[first_name last_name])
          end
      end
    end
  end
end
