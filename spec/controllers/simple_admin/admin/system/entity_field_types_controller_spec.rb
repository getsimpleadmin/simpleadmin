require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::EntityFieldTypesController, type: :controller do
  let(:resource) { create :entity_field_type }
  let(:resources) { create_list :entity_field_type, 1 }

  let(:after_create_path) { admin_system_entity_field_types_path }
  let(:after_update_path) { admin_system_entity_field_types_path  }
  let(:after_destroy_path) { admin_system_entity_field_types_path }

  let(:resource_attributes) do
    {
      name: :name,
      value: 'Test'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_entity_field_type: { name: resource_attributes[:value], template: 'simple_admin/fields/string' }
    }
  end

  it_behaves_like :controller_crud
end
