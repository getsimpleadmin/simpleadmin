require 'rails/generators/base'

module SimpleAdmin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      def copy_initializer
        template 'initializers/devise.rb.erb', 'config/initializers/devise.rb'
        template 'initializers/rolify.rb.erb', 'config/initializers/rolify.rb'

        template 'initializers/simple_admin.rb.erb', 'config/initializers/simple_admin.rb'
      end
    end
  end
end
