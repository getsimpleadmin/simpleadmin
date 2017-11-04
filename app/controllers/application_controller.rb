class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    admin_root_path(current_locale)
  end

  def current_locale
    @current_locale ||= { locale: SimpleAdmin::Setting.default_language }
  end

  helper_method :current_locale
end
