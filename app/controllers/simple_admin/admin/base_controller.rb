module SimpleAdmin
  module Admin
    class BaseController < ApplicationController
      include ResourceFields
      include ResourceCrud

      layout 'simple_admin'

      before_action :authenticate_user!
      before_action :respond_with_locale

      private

      def respond_with_locale
        I18n.locale = params[:locale]
      end
    end
  end
end
