require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::SettingsController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe '#index' do
    let(:settings) { SimpleAdmin::Setting.where(name: :default_language) }

    subject { get :index }

     it { is_expected.to have_http_status(200) }
  end

  describe '#update_batch' do
    let(:setting) { SimpleAdmin::Setting.find_by(name: :default_language) }
    let(:params) do
      {
        setting: {
          setting.to_param => 'en'
        }
      }
    end

    subject { patch :update_batch, params: params }

    it 'return updated resource' do
      expect(subject).to redirect_to admin_system_settings_path(current_locale)
      expect(setting.reload.value).to eq 'en'
    end
  end
end
