require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::SettingsController, type: :controller do
  let(:user) { create :user, :with_role, user_role: :admin }

  before { sign_in user }
  
  describe '#index' do
    let(:settings) { SimpleAdmin::Setting.where(name: :default_language) }

    subject { get :index }

    it { is_expected.to have_http_status(200) }
  end
end
