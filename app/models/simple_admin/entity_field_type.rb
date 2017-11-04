module SimpleAdmin
  class EntityFieldType < Base
    belongs_to :entity_field, optional: true
  end
end
