module SimpleAdmin
  module Admin
    module System
      class PluginsController < BaseController
        include SimpleAdmin::ResourceCrud

        before_action :plugin_type

        def new
          @resource = model_klass.new
          @resource.feature_items.build

          render template_path
        end

        def model_klass
          SimpleAdmin::Plugin
        end

        def after_create_path
          admin_system_plugin_types_path
        end

        def after_update_path
          admin_system_plugin_types_path
        end

        def after_destroy_path
          admin_system_plugin_types_path
        end

        def plugin_type
          @plugin_type ||= SimpleAdmin::PluginType.find(params[:plugin_type_id])
        end

        private

        def resource_params
          params.require(:simple_admin_plugin).permit(:name, :label, :plugin_type_id, feature_items_attributes: [:object_id, :object_type])
        end

        def template_path(controller_action=nil)
          "simple_admin/plugins/#{@plugin_type.name}/#{params[:action]}"
        end
      end
    end
  end
end
