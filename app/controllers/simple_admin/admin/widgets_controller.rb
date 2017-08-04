module SimpleAdmin
  module Admin
    class WidgetsController < BaseController
      include ::Widgets::Menu

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
