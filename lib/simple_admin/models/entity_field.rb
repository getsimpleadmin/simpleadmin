module SimpleAdmin
  class EntityField < Base
    enum display: %i[collection show form]

    has_one :entity_field_type
  end
end
