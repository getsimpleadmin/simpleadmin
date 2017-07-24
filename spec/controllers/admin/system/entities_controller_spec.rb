require 'spec_helper'

RSpec.describe Admin::System::EntitiesController, type: :controller do
  let(:resource) { create :entity }
  let(:resources) { create_list :entity, 1 }

  let(:resource_path) { admin_system_entities_path(locale: SimpleAdmin::Setting.default_language) }
  let(:resource_attributes) do
    {
      name: :name,
      value: 'Test'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_entity: { name: resource_attributes[:value] }
    }
  end

  it_behaves_like :crud_testing
end
