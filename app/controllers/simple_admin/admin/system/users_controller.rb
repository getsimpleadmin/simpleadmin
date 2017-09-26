module SimpleAdmin
  module Admin
    module System
      class UsersController < BaseController
        include ResourceController::Crudify

        def new
          @resource = model_klass.new
          @resource.build_profile

          render template_path
        end

        def update
          @resource = model_klass.find(params[:id])

          if update_resource_by_password(@resource)
            redirect_to after_update_path, notice: t('.success')
          else
            render :edit
          end
        end

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
            params.require(:simple_admin_user).permit(:email, :password, :password_confirmation, profile_attributes: [:first_name, :last_name])
          end

          def update_resource_by_password(resource)
            if password_change?
              resource.update(resource_params)
            else
              resource.update_without_password(resource_params)
            end
          end

          def password_change?
            case params[:password_change]
            when 'true'
              true
            when 'false'
              false
            end
          end
      end
    end
  end
end
