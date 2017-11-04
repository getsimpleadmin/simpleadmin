module SimpleAdmin
  module Widgets
    class FeatureItemsController < BaseController
      def new
        @feature_item = SimpleAdmin::WidgetFeatureItem.new
      end

      def autocomplete
        @posts = SimpleAdmin::Post.with_translations(:en).where("title LIKE ?", "%#{params[:title]}%")

        render json: @posts
      end
    end
  end
end
