module SimpleAdmin
  module Admin
    module System
      class SettingsController < SystemController
        def index
          @resources = SimpleAdmin::Setting.order(sort_order: :asc)
        end

        def update_batch
          @settings = SimpleAdmin::Setting.find(params[:setting].keys)

          @settings.each do |setting|
            setting.update(value: params[:setting][setting.to_param])
          end

          redirect_to admin_system_settings_path(current_locale)
        end
      end
    end
  end
end
