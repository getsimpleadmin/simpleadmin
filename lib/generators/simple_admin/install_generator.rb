require 'rails/generators/base'
require 'rails/generators/active_record'

module SimpleAdmin
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      argument :name, default: 'simple_admin'
      source_root File.expand_path("../../templates", __FILE__)

      def copy_initializer
        template 'initializers/simple_admin.rb.erb', 'config/initializers/simple_admin.rb'
        template 'initializers/devise.rb.erb',       'config/initializers/devise.rb'
        template 'initializers/friendly_id.rb.erb',  'config/initializers/friendly_id.rb'
      end

      def copy_simple_admin_migration
        migration_template "migrations/migration.rb", "db/migrate/create_simple_admin_migrations.rb"
        migration_template "migrations/translation_migration.rb", "db/migrate/create_simple_admin_translation_migrations.rb"
        migration_template "migrations/demo_data_migration.rb", "db/migrate/create_simple_admin_demo_data_migrations.rb"
      end

      def copy_locale
        copy_file "../../../config/locales/ru.yml", "config/locales/simple_admin.ru.yml"
        copy_file "../../../config/locales/en.yml", "config/locales/simple_admin.en.yml"
      end

      def create_assets
        generate "simple_admin:assets"
      end
    end
  end
end
