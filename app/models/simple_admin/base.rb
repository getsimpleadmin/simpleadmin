module SimpleAdmin
  class Base < ApplicationRecord
    self.abstract_class = true
    self.table_name_prefix = 'simple_admin_'

    class << self
      def custom_model_names(namespace='SimpleAdmin')
        ApplicationRecord.descendants.map do |model|
          [model.name, model.name] unless model.name.include?(namespace)
        end.compact
      end
    end
  end
end
