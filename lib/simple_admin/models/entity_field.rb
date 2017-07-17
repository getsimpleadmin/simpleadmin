module SimpleAdmin
  class EntityField < Base
    enum display: %i[collection show form]

    belongs_to :entity, optional: true

    has_one :entity_field_type
  end
end
