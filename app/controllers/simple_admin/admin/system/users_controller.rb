module SimpleAdmin
  module Admin
    module System
      class UsersController < BaseController
        include SimpleAdmin::ResourceCrud

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
            render template: template_path(:edit)
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

        def resource_params
          params.require(:simple_admin_user).permit(:email, :password, :password_confirmation, profile_attributes: [:first_name, :last_name])
        end

        def template_path(controller_action=nil)
          "#{params[:controller]}/#{params[:action]}"
        end
      end
    end
  end
end
