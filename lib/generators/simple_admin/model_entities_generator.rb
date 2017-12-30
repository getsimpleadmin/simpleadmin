require 'rails/generators/base'

module SimpleAdmin
  module Generators
    class ModelEntitiesGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../../templates', __FILE__)
      class_option :fields, type: :hash, default: nil, required: false, aliases: '-f'

      FIELD_TYPES_MATCH = { integer: :number,
                            decimal: :number,
                            date: :string,
                            datetime: :string }.freeze

      EXCLUSION_FIELDS = /\bid\b|created_at|updated_at/

      desc 'rails g simple_admin:model_entities Model --fields=id:number title:string body:text'
      def handle_entity
        @fields = options[:fields] || model_columns
        if SimpleAdmin::Entity.exists?(model_klass_name: name)
          update_entity
        else
          create_entity
        end
      rescue StandardError => e
        abort("Something went wrong: #{e.message}")
      end

      private

      def create_entity
        entity = SimpleAdmin::Entity.create(model_klass_name: name, label: name.pluralize)
        @fields.each_with_index do |(name, type), i|
          SimpleAdmin::EntityField.send(:"create_#{rename(type)}_field",
                                        name: name,
                                        entity: entity,
                                        sort_order: i + 1,
                                        presentation: :collection)
        end
      end

      def update_entity
        entity = SimpleAdmin::Entity.find_by(model_klass_name: name)
        SimpleAdmin::EntityFieldType.build_helper_methods!

        @fields.each do |name, type|
          next if SimpleAdmin::EntityField.exists?(entity: entity, name: name)
          SimpleAdmin::EntityField.send(:"create_#{rename(type)}_field",
                                        name: name,
                                        entity: entity,
                                        presentation: :collection)
        end
      end

      def model_columns
        model_name.columns.map do |c|
          next if c.name.match EXCLUSION_FIELDS
          [c.name, c.type]
        end.compact.to_h
      end

      def model_name
        name.constantize
      end

      def rename(type)
        FIELD_TYPES_MATCH[type] || type
      end
    end
  end
end
