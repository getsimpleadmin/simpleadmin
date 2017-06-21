module SimpleAdmin
  class EntityFieldSettingDataSerializer
    def load(attributes_list)
      return if attributes_list.nil?

      attributes_list.map do |attributes|
        SimpleAdmin::FieldSetting.new(attributes)
      end
    end

    def dump(field_settings)
      return if field_settings.nil?

      field_settings.map(&:as_json)
    end
  end
end
