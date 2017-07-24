module ControllerHelpers
  def current_locale
    {
      locale: SimpleAdmin::Setting.default_language
    }
  end
end
