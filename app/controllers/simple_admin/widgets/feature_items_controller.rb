module SimpleAdmin
  module Widgets
    class FeatureItemsController < BaseController
      def new
        @widget = SimpleAdmin::Widget.new
        @widget.widget_type_id = widget_type.id
      end

      def edit
        @widget = SimpleAdmin::Widget.find_by(name: params[:id])
        @feature_items = SimpleAdmin::WidgetFeatureItem.where(widget_id: @widget.id)
      end

      def autocomplete
        @posts = SimpleAdmin::Post.with_translations(params[:locale]).where('title LIKE ?', "%#{params[:title]}%")

        render json: @posts
      end

      private

      def widget_type
        @widget_type ||= SimpleAdmin::WidgetType.find_by(name: :featured)
      end
    end
  end
end
