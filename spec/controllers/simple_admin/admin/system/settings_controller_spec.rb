require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::System::SettingsController, type: :controller do
  let(:user) { create :user, :with_role, user_role: :admin }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe '#index' do
    let(:settings) { SimpleAdmin::Setting.where(name: :default_language) }

    subject { get :index }

    it { is_expected.to have_http_status(200) }
  end
end
