require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::EntitiesController, type: :controller do
  let(:resource) { create :entity }
  let(:resources) { create_list :entity, 1 }

  let(:after_create_path) { edit_admin_system_entity_path(resource.class.last) }
  let(:after_update_path) { admin_system_entities_path  }
  let(:after_destroy_path) { admin_system_entities_path }

  let(:resource_attributes) do
    {
      name: :model_klass_name,
      value: 'SimpleAdmin::Category'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_entity: { model_klass_name: resource_attributes[:value] }
    }
  end

  it_behaves_like :controller_crud
end
