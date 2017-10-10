require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::UserPermissionsController, type: :controller do
  let(:role) { SimpleAdmin::Role.find_by(name: :admin) }
  let(:resource) { create :user_permission, role: role }

  before { SimpleAdmin::UserPermission.delete_all }

  let(:resource_attributes) do
    {
      name: :action,
      value: 'cannot'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_user_permission: { action: resource_attributes[:value], role_id: role.id }
    }
  end

  it_behaves_like :controller_dynamic_crud
end
