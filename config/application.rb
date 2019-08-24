# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Simpleadmin
  class Application < Rails::Application
    config.load_defaults 5.2

    config.filter_parameters << :secret_key

    config.i18n.available_locales = %i[en]
    config.i18n.default_locale = :en

    config.exceptions_app = routes
  end
end
