module SimpleAdmin
  module Abstractions
    class Model
      def self.list
        models = ApplicationRecord.descendants.map do |model|
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

      def self.attributes_by_model_klass(model_klass_name)
        model_klass = model_klass_name.safe_constantize

        return if model_klass.nil?

        {
          name:         model_klass.name,
          column_names: model_klass.column_names,
          columns:      model_klass.columns.map { |column| { name: column.name, type: column.sql_type.parameterize.underscore } },
          reflections:  model_klass.reflections.keys
        }
      end

      def self.find_by_name(name)
        model_klass = name.safe_constantize

        if ApplicationRecord.descendants.include?(model_klass)
          model_klass
        elsif model_klass.nil?
          raise ArgumentError
        else
          raise SecurityError
        end
      end

      def self.search(search_query, model_klass, model_attributes)
        return [] if model_attributes.empty?

        query = model_attributes.map { |model_attribute| "#{model_attribute} LIKE ?" }.join(' OR ')
        query_arguments = model_attributes.map { "%#{search_query}%" }

        OpenStruct.new(
          resources: model_klass.where(query, *query_arguments),
          total: model_klass.where(query, *query_arguments).count
        )
      end
    end
  end
end
