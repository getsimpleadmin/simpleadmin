module SimpleAdmin
  module Admin
    class WidgetsController < BaseController
      def index
        @widget_types = SimpleAdmin::WidgetType.all

        render template_path
      end

      def create
        @widget = SimpleAdmin::Widget.new(resource_params)

        if @widget.save
          initialize_widget!
          after_create_callbacks

          redirect_to redirect_path
        else
          raise NotImplemented
        end
      end

      def update
        @widget = SimpleAdmin::Widget.find_by(name: params[:id])

        if @widget.update(resource_params)
          initialize_widget!
          after_update_callbacks

          redirect_to redirect_path
        else
          raise NotImplemented
        end
      end

      def destroy
        @widget = SimpleAdmin::Widget.find_by(name: params[:id])
        @widget.destroy

        redirect_to redirect_path
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

      def initialize_widget!
        concern_name = @widget.widget_type.name.camelize
        concern_namespace = 'SimpleAdmin::Widgets'

        self.class.include "#{concern_namespace}::#{concern_name}".constantize
      end

      def after_update_callbacks
        raise NotImplementedError
      end

      def after_create_callbacks
        raise NotImplementedError
      end

      def enable_entity_fields
        false
      end

      def resource_params
        params.require(:simple_admin_widget).permit(:name, :label, :widget_type_id)
      end
    end
  end
end
