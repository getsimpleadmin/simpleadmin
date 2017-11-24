require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::EntityFieldsController, type: :controller do
  let!(:entity) { create :entity }
  let(:entity_field_type) { create :entity_field_type }

  let(:resource) { create :entity_field, name: :title, entity: entity, entity_field_type_id: entity_field_type.id }

  let(:resource_attributes) do
    {
      name: :name,
      value: 'description'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_entity_field: { name: resource_attributes[:value], entity_id: entity.id,
                                   entity_field_type_id: entity_field_type.id }
    }
  end

  it_behaves_like :controller_dynamic_crud
end
