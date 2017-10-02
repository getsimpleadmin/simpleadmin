require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::UserRolesController, type: :controller do
  let(:resource) { create :role }

  let(:after_update_path)  { admin_system_user_roles_path }
  let(:after_create_path)  { admin_system_user_roles_path }
  let(:after_destroy_path) { admin_system_user_roles_path }

  let(:resource_attributes) do
    {
      name: :name,
      value: 'editor'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_user_role: { name: resource_attributes[:value] }
    }
  end

  it_behaves_like :controller_crud
end
