module SimpleAdmin
  module Admin
    module System
      class ProfilesController < BaseController
        def edit
        end

        def update
          if current_user.update(resource_params)
            redirect_to admin_posts_path
          else
            render :edit
          end
        end

        private

        def resource_params
          params.require(:simple_admin_user).permit(:email, profile_attributes: [:first_name, :last_name, :avatar])
        end
      end
    end
  end
end
