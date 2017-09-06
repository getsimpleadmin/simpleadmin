module SimpleAdmin
  module Admin
    module Design
      class LayoutsController < BaseController
        include SimpleAdmin::ResourceCrud

        def model_klass
          SimpleAdmin::Layout
        end

        def after_create_path
          admin_design_layouts_path
        end

        def after_update_path
          admin_design_layouts_path
        end

        def after_destroy_path
          admin_design_layouts_path
        end

        private

        def resource_params
          params.require(:simple_admin_layout).permit(:name, :template)
        end

        def template_path(controller_action=nil)
          "#{params[:controller]}/#{params[:action]}"
        end
      end
    end
  end
end
