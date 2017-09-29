require 'rails/generators/active_record'

module SimpleAdmin
  module Generators
    class MigrationGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      argument :name, default: 'simple_admin'

      def copy_simple_admin_migration
        migration_template 'migrations/devise_migration.rb', 'db/migrate/create_simple_admin_devise_migration.rb'
        migration_template 'migrations/core_migrations/profiles_migration.rb', 'db/migrate/create_simple_admin_profiles.rb'

        migration_template 'migrations/rolify_migration.rb', 'db/migrate/create_simple_admin_rolify_migration.rb'

        migration_template 'migrations/core_migrations/entities_migration.rb', 'db/migrate/create_simple_admin_entities.rb'

        migration_template 'migrations/core_migrations/entity_fields_migration.rb', 'db/migrate/create_simple_admin_entity_fields.rb'
        migration_template 'migrations/core_migrations/entity_field_types_migration.rb', 'db/migrate/create_simple_admin_entity_field_types.rb'
        migration_template 'migrations/core_migrations/entity_field_settings_migration.rb', 'db/migrate/create_simple_admin_entity_field_settings.rb'

        migration_template 'migrations/core_migrations/settings_migration.rb', 'db/migrate/create_simple_admin_settings.rb'

        migration_template 'migrations/core_data_migration.rb', 'db/migrate/create_simple_admin_core_data_migration.rb'

        # PLUGINS #
        migration_template 'migrations/plugins/featured_migration.rb', 'db/migrate/create_simple_admin_featured_plugin_migration.rb'
      end
    end
  end
end
