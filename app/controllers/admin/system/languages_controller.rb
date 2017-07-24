module Admin
  module System
    class LanguagesController < BaseController
      include SimpleAdmin::CrudControllerHelper

      def model_klass
        SimpleAdmin::Language
      end

      def redirect_path
        admin_system_languages_path(locale: current_locale)
      end

      private

      def resource_params
        params.require(:simple_admin_language).permit(:name, :code, :status)
      end
    end
  end
end
