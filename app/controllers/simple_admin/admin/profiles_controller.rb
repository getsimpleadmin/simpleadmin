module SimpleAdmin
  module Admin
    class ProfilesController < BaseController
      def edit
        current_user.build_profile if current_user.profile.blank?
      end

      def update
        if current_user.update(resource_params)
          redirect_to admin_root_path(current_locale), notice: t('.success')
        else
          render :edit
        end
      end

      private

      def resource_params
        params.require(:simple_admin_user).permit(:email, profile_attributes: [:first_name, :last_name, :twitter_nickname])
      end

      def enable_entity_fields
        false
      end
    end
  end
end
