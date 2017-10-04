require 'jquery-rails'
require 'jquery-ui-rails'
require 'sass-rails'
require 'bootstrap-sass'
require 'coffee-rails'
require 'best_in_place'
# require 'devise'
require 'kaminari'
require 'rolify'
require 'cancancan'

require 'rails-assets-notifyjs'
require 'rails-assets-jquery-tags-input'

module SimpleAdmin
  class Engine < Rails::Engine
    initializer 'simple_admin.precompile', group: :all do |app|
      app.config.assets.precompile += [
        'simple_admin/application.css',
        'simple_admin/application.js'
      ]
    end
  end
end
