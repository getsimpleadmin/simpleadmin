module SimpleAdmin
  class Base < ApplicationRecord
    self.abstract_class = true
    self.table_name_prefix = 'simple_admin_'

    def self.create_with_translation(translation_data, *attributes)
      resource_instance = new(*attributes)

      translation_data.each do |language_code, values|
        I18n.locale = language_code
        values.each do |attribute_name, value|
          resource_instance.public_send("#{attribute_name}=", value)
        end
      end

      resource_instance.save
    end
  end
end
