module SimpleAdmin
  module Admin
    module System
      class SettingsController < BaseController
        def index
          @setting_default_language = SimpleAdmin::Setting.default_language
          @setting_site_url = SimpleAdmin::Setting.site_url
        end

        def update
          @resource = SimpleAdmin::Setting.find(params[:id])

          respond_to do |format|
            if @resource.update_attributes(resource_params)
              format.html { redirect_to(@resource, notice: 'Setting was successfully updated.') }
              format.json { respond_with_bip(@resource) }
            else
              format.html { render action: :index }
              format.json { respond_with_bip(@resource) }
            end
          end
        end

        private

        def resource_params
          params.require(:simple_admin_setting).permit(:value)
        end
      end
    end
  end
end
