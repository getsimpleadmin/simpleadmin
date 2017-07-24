module Admin
  module System
    class SettingsController < BaseController

      def index
        @settings = SimpleAdmin::Setting.all
      end

      def update
        @setting = SimpleAdmin::Setting.find(params[:id])
        @setting.update(resource_params)

        redirect_to admin_system_settings_path(current_locale)
      end

      private

      def resource_params
        params.require(:simple_admin_setting).permit(:value)
      end
    end
  end
end
