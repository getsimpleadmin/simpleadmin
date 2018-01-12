require 'rails/generators/base'

module SimpleAdmin
  module Generators
    class ModelEntitiesGenerator < Rails::Generators::NamedBase
      # Generate SimpleAdmin::Entity by transmitted model
      #
      # @example
      #   rails generate simple_admin:model_entities Post
      #
      # @since 0.1.2-alpha

      source_root File.expand_path('../../templates', __FILE__)

      EXCLUSION_FIELDS = /\bid\b|created_at|updated_at/

      desc 'rails g simple_admin:model_entities Model'

      def generate
        entity = SimpleAdmin::Entity.find_or_create_by(model_klass_name: name)

        model_columns.each do |name, type|
          entity_field_type = SimpleAdmin::EntityFieldType.find_by!(name: fetch_field_type(type))

          entity.entity_fields.create(name: name, entity_field_type_id: entity_field_type.id, presentation: :collection)
          entity.entity_fields.create(name: name, entity_field_type_id: entity_field_type.id, presentation: :form)
        end
      end

      private

        def fetch_field_type(type)
          field_types = I18n.t('simple_admin.field_types_match')
          field_types[type] || type
        end

        def model_columns
          model_klass.columns.each_with_object({}) do |column, hash|
            next if column.name.match?(EXCLUSION_FIELDS)
            hash[column.name] = column.type
          end
        end

        def model_klass
          name.constantize
        end
    end
  end
end
