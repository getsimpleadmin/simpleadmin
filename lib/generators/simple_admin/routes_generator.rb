require 'rails/generators/named_base'

module SimpleAdmin
  module Generators
    class RoutesGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      source_root File.expand_path('../templates', __FILE__)
      argument :name, default: 'simple_admin'

      def add_simple_admin_routes
        route "devise_for :users, class_name: 'SimpleAdmin::User', controllers: { sessions: 'simple_admin/sessions' }"
      end
    end
  end
end
