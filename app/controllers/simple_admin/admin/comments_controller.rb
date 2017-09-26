module SimpleAdmin
  module Admin
    class CommentsController < BaseController
      include ResourceController::DynamicFields
      include ResourceController::Crudify

      def after_create_path
        admin_comments_path
      end

      def after_update_path
        admin_comments_path
      end

      def after_destroy_path
        admin_comments_path
      end

      def model_klass
        SimpleAdmin::Comment
      end

      private

        def template_path(controller_action=nil)
          "simple_admin/admin/resource/#{controller_action || params[:action]}"
        end
    end
  end
end
