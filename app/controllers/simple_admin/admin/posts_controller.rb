module SimpleAdmin
  module Admin
    class PostsController < BaseController
      include ResourceController::DynamicFields
      include ResourceController::Crudify

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

        def template_path(controller_action=nil)
          "simple_admin/admin/resource/#{controller_action || params[:action]}"
        end

        def resource_modificator
          current_user.posts
        end
    end
  end
end
