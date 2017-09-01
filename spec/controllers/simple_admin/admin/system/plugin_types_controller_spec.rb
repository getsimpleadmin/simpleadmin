require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::PluginTypesController, type: :controller do
  let(:user) { create :user, :with_role, user_role: :admin }

  before { sign_in user }

  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(200) }
  end

  describe '#update' do
    let(:plugin_type) { create :plugin_type }

    let(:params) do
      {
        id: plugin_type.id
      }
    end

    subject { patch :update, params: params }

    it 'update plugin type status' do
      expect(subject).to redirect_to admin_system_plugin_types_path
      expect(plugin_type.reload.status).to eq 'active'
    end
  end

end
