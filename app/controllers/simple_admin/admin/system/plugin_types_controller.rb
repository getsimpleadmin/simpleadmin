module SimpleAdmin
  module Admin
    module System
      class PluginTypesController < BaseController
        def index
          @resources = SimpleAdmin::PluginType.all
        end

        def update
          @resource = SimpleAdmin::PluginType.find(params[:id])

          if @resource.active?
            @resource.inactivate!
          else
            @resource.activate!
          end

          redirect_to admin_system_plugin_types_path, notice: t('.success')
        end
      end
    end
  end
end
