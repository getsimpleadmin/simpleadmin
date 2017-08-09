module SimpleAdmin
  module Widgets
    module Featured
      extend ActiveSupport::Concern

      included do
        def create_feature_items!
          post_ids = params[:post_ids]

          if post_ids.present?
            post_ids.each do |post_id|
              SimpleAdmin::WidgetFeatureItem.create(object_type: SimpleAdmin::Post.to_s, object_id: post_id, widget_id: @widget.id)
            end
          end
        end

        private

        def after_update_callbacks
          SimpleAdmin::WidgetFeatureItem.where(widget_id: @widget.id).destroy_all
          create_feature_items!
        end

        def after_create_callbacks
          create_feature_items!
        end
      end
    end
  end
end
