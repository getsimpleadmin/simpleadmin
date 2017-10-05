require 'rails/generators/base'

module SimpleAdmin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      def copy_initializer
        template 'initializers/rolify.rb.erb', 'config/initializers/rolify.rb'
      end

      def create_application_controller
        copy_file(
          'application_controller.rb',
          'app/controllers/simple_admin/admin/application_controller.rb'
        )
      end

      def create_user_model
        copy_file(
          'user.rb',
          'app/models/simple_admin/user.rb'
        )
      end

      def create_views
        if defined?(Devise)
          create_devise_views!
        end
      end

      private

        def create_devise_views!
          copy_file('views/devise/registrations/new.html.erb', 'app/views/devise/registrations/new.html.erb')
          copy_file('views/devise/sessions/new.html.erb',      'app/views/devise/sessions/new.html.erb')
          copy_file('views/devise/shared/_footer.html.erb',    'app/views/devise/shared/_footer.html.erb')
        end
    end
  end
end
