module Admin
  module System
    class EntitiesController < BaseController
      before_action only: [:new, :edit] do
        Rails.application.eager_load!
      end

      def model_klass
        SimpleAdmin::Entity
      end

      def redirect_path
        admin_system_entities_path(current_locale)
      end

      private

      def resource_params
        params.require(:simple_admin_entity).permit(:model_klass_name)
      end
    end
  end
end
