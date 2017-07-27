require 'spec_helper'

RSpec.describe Admin::System::SettingsController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe '#index' do
    let(:settings) { SimpleAdmin::Setting.where(name: :default_language) }

    subject { get :index }

     it { is_expected.to have_http_status(200) }
  end

  describe '#update' do
    let(:setting) { SimpleAdmin::Setting.find_by(name: :default_language) }
    let(:params) do
      {
        id: setting.id,
        simple_admin_setting: {
          value: :en
        }
      }
    end

    subject { patch :update, params: params }

    it 'update resource' do
      expect(subject).to redirect_to admin_system_settings_path(current_locale)

      expect(setting.reload.value).to eq 'en'
    end
  end
end
