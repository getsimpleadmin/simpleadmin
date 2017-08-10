module SimpleAdmin
  module Admin
    class WidgetTypesController < BaseController
      def update
        @widget_type = SimpleAdmin::WidgetType.find_by(name: params[:id])

        @widget_type.status = !@widget_type.status
        @widget_type.save

        redirect_to admin_widgets_path(current_locale)
      end

      private

      def enable_entity_fields
        false
      end
    end
  end
end
