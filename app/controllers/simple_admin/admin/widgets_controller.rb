module SimpleAdmin
  module Admin
    class WidgetsController < BaseController

      def index
        @widget_types = SimpleAdmin::WidgetType.all

        render template_path
      end

      def edit
        render "simple_admin/admin/widgets/#{params[:id]}/widget"
      end

      def model_klass
        SimpleAdmin::Widget
      end

      def redirect_path
        admin_widgets_path(current_locale)
      end

      private

      def enable_entity_fields
        false
      end

      def resource_params
        params.require(:simple_admin_widget).permit(:name, :sort_order, :data)
      end
    end
  end
end
