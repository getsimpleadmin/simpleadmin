module SimpleAdmin
  class EntityFieldSetting < Base
    belongs_to :entity_field, optional: true

    serialize :data, EntityFieldSettingDataSerializer.new

    def select_field
      data.find { |setting| setting.name == 'select_collection' }
    end
  end
end
