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
          'app/controllers/simple_admin/application_controller.rb'
        )
      end
    end
  end
end
