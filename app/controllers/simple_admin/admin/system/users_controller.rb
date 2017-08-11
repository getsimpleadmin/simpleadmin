module SimpleAdmin
  module Admin
    module System
      class UsersController < SystemController
        def new
          @resource = model_klass.new
          @resource.build_profile

          render template_path
        end

        def edit
          @resource = model_klass.find(params[:id])
          @resource.build_profile if @resource.profile.blank?

          render template_path
        end

        def model_klass
          SimpleAdmin::User
        end

        def redirect_path
          admin_system_users_path(current_locale)
        end

        private

        def resource_params
          params.require(:simple_admin_user).permit(:email, profile_attributes: [:first_name, :last_name])
        end
      end
    end
  end
end
