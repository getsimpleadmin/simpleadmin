require 'spec_helper'

RSpec.describe Admin::System::EntityFieldTypesController, type: :controller do
  let(:resource) { create :entity_field_type }
  let(:resources) { create_list :entity_field_type, 1 }

  let(:resource_path) { admin_system_entity_field_types_path(current_locale) }
  let(:resource_attributes) do
    {
      name: :name,
      value: 'Test'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_entity_field_type: { name: resource_attributes[:value] }
    }
  end

  it_behaves_like :crud_testing
end
