require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::ProfilesController, type: :controller do
  let(:user) { create :user, :with_role, user_role: :admin }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe '#edit' do
    let(:params) do
      {
        id: user.id
      }
    end

    subject { get :edit, params: params }

    it { is_expected.to have_http_status(200) }
  end

  describe '#update' do
    let(:params) do
      {
        id: user.id,
        simple_admin_user: {
          email: 'johndoe@example.com'
        }
      }
    end

    subject { patch :update, params: params }

    it 'update profile' do
      expect(subject).to redirect_to admin_root_path
      expect(user.reload.email).to eq 'johndoe@example.com'
    end
  end
end
