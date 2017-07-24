module Admin
  class BaseController < ActionController::Base
    layout 'simple_admin'

    include SimpleAdmin::EntityControllerSetter
    include SimpleAdmin::ResourceFieldsControllerSetter

    before_action :respond_with_locale

    def current_locale
      @current_locale ||= { locale: SimpleAdmin::Setting.default_language }
    end

    helper_method :current_locale

    private

    def respond_with_locale
      I18n.locale = params[:locale]
    end
  end
end
