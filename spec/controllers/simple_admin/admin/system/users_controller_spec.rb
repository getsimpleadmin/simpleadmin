require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::UsersController, type: :controller do
  let(:resource) { create :user, email: 'example@example.com' }

  let(:after_update_path) { admin_system_users_path }
  let(:after_create_path) { admin_system_users_path }
  let(:after_destroy_path) { admin_system_users_path }

  let(:resource_attributes) do
    {
      name: :email,
      value: 'johndoe@example.com'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_user: { email: resource_attributes[:value], password: '123456', password_confirmation: '123456' }
    }
  end

  it_behaves_like :controller_crud
end
