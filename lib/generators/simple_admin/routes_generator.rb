require 'rails/generators/named_base'

module SimpleAdmin
  module Generators
    class RoutesGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      argument :name, default: 'simple_admin'
      source_root File.expand_path("../templates", __FILE__)

      def add_simple_admin_routes
        route "devise_for :users, class_name: 'SimpleAdmin::User'"
      end
    end
  end
end
