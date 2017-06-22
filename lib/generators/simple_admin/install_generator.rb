require 'rails/generators/active_record'

module SimpleAdmin
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      argument :name, default: 'simple_admin'
      source_root File.expand_path("../../templates", __FILE__)

      def copy_initializer
        @underscored_user_name = name.underscore.gsub('/', '_')
        @use_authentication_method = options[:users].present?
        template 'simple_admin.rb.erb', 'config/initializers/simple_admin.rb'
      end

      def copy_simple_admin_migration
        migration_template "migrate.rb", "db/migrate/create_simple_admin_migrations.rb"
      end

      def create_assets
        generate "simple_admin:assets"
      end
    end
  end
end
