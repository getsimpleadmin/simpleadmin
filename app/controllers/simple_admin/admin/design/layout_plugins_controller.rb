module SimpleAdmin
  module Admin
    module Design
      class LayoutPluginsController < BaseController
        def create
          @resource = SimpleAdmin::LayoutPlugin.new(resource_params)
          @resource.save

          respond_to do |format|
            format.js { render layout: false }
          end
        end

        def update
          @resource = SimpleAdmin::LayoutPlugin.find(params[:id])
          @resource.update(resource_params)

          respond_to do |format|
            format.js { render layout: false }
          end
        end

        def destroy
          @resource = SimpleAdmin::LayoutPlugin.find(params[:id])
          @resource.destroy

          respond_to do |format|
            format.js { render layout: false }
          end
        end

        private

          def resource_params
            params.require(:simple_admin_layout_plugin).permit(:plugin_id, :layout_id, :sort_order)
          end
      end
    end
  end
end
