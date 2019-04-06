module SimpleAdmin
  module Abstractions
    module Model
      def list
        models = allowed_models.map do |model|
          name = model.name
          columns = model.columns.map do |column|
            {
              name: column.name,
              type: column.sql_type.parameterize.underscore
            }
          end

          { name: name, columns: columns }
        end

        { models: models }
      end

      module_function :list

      def attributes_by_model_klass(model_klass_name)
        model_klass = model_klass_name.safe_constantize

        return if model_klass.nil?

        {
          name:         model_klass.name,
          column_names: model_klass.column_names,
          columns:      model_klass.columns.map { |column| { name: column.name, type: column.sql_type.parameterize.underscore } },
          reflections:  model_klass.reflections.keys
        }
      end

      module_function :attributes_by_model_klass

      def find_by_name(name)
        model_klass = name.safe_constantize

        model_klass if allowed_models.include?(model_klass)
      end

      module_function :find_by_name

      def search(search_query, model_klass, model_attributes)
        return [] if model_attributes.empty?

        query = model_attributes.map { |model_attribute| "#{model_attribute} LIKE ?" }.join(' OR ')
        query_arguments = model_attributes.map { "%#{search_query}%" }

        OpenStruct.new(
          resources: model_klass.where(query, *query_arguments),
          total: model_klass.where(query, *query_arguments).count
        )
      end

      module_function :search

      def allowed_models
        ApplicationRecord.descendants.reject { |model| Simpleadmin::Config.instance.excluded_models.include?(model) }
      end

      module_function :allowed_models
    end
  end
end
