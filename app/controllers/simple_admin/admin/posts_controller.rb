module SimpleAdmin
  module Admin
    class PostsController < BaseController
      include ResourceFields
      include ResourceCrud

      def after_create_path
        admin_posts_path
      end

      def after_update_path
        admin_posts_path
      end

      def after_destroy_path
        admin_posts_path
      end

      def model_klass
        SimpleAdmin::Post
      end

      private

        def action_resource_modificator
          current_user.posts
        end
    end
  end
end
