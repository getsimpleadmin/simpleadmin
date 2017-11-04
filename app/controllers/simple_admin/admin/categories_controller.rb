module SimpleAdmin
  module Admin
    class CategoriesController < BaseController
      include ResourceFields
      include ResourceCrud

      def after_create_path
        admin_categories_path
      end

      def after_update_path
        admin_categories_path
      end

      def after_destroy_path
        admin_categories_path
      end

      def model_klass
        SimpleAdmin::Category
      end
    end
  end
end
