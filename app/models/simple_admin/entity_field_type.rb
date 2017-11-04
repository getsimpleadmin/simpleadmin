module SimpleAdmin
  class EntityFieldType < Base
    belongs_to :entity_field, optional: true

    after_create :initialize_helper_methods!

    private

    # Define entity fields model methods to simplify creation.
    # You not need to define entity_field_type directly
    # Use:
    #   SimpleAdmin::EntityField.create_string_field(name: :title, entity: entity, presentation: :collection)
    #   SimpleAdmin::EntityField.create_number_field(name: :id, entity: entity, presentation: :collection)
    #
    def initialize_helper_methods!
      SimpleAdmin::EntityFieldType.pluck(:name).each do |field_type_name|
        SimpleAdmin::EntityField.define_singleton_method("create_#{field_type_name}_field") do |params|
          params[:entity_field_type_id] = SimpleAdmin::EntityFieldType.find_by(name: field_type_name).to_param
          create(params)
        end
      end
    end
  end
end
