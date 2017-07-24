require 'spec_helper'

RSpec.describe Admin::SettingsController, type: :controller do

  describe '#index' do
    let(:settings) { create_list :setting, 1 }

    subject { get :index }

    it 'render settings' do
      expect(subject.status).to eq 200
      expect(assigns(:settings)).to eq settings
    end
  end

  describe '#update' do
    let(:setting) { create :setting, name: :default_language, value: :en }
    let(:params) do
      {
        id: setting.id,
        simple_admin_setting: {
          value: :ru
        }
      }
    end

    subject { patch :update, params: params }

    it 'update resource' do
      expect(subject).to redirect_to admin_settings_path(locale: I18n.locale)
      expect(assigns(:setting)).to eq setting

      expect(setting.reload.value).to eq 'test'
    end
  end
end
