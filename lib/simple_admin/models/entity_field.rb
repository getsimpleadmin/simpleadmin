module SimpleAdmin
  class EntityField < Base
    enum display: %i[index show form]

    belongs_to :entity, optional: true

    has_one :entity_field_type, primary_key: :entity_field_type_id, foreign_key: :id
    has_one :entity_field_setting
  end
end
