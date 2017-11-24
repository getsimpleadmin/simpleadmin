require 'kaminari'

require 'bootstrap-sass'
require 'jquery-ui-rails'

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
