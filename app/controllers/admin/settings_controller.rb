module Admin
  class SettingsController < BaseController

    def index
      @settings = SimpleAdmin::Setting.all
    end

    def update
    end

    private

    def resource_params
      params.require(:simple_admin_setting).permit(:name, :value)
    end
  end
end
