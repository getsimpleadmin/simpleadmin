require 'spec_helper'

RSpec.describe Admin::System::EntitiesController, type: :controller do
  let(:resource) { create :entity }
  let(:resources) { create_list :entity, 1 }

  let(:resource_path) { admin_system_entities_path(current_locale) }
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

  it_behaves_like :crud_testing
end
