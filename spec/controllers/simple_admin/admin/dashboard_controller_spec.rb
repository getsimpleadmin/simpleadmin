require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::DashboardController, type: :controller do
  let(:user) { create :user, :with_role, user_role: :admin }

  before { sign_in user }
  
  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(200) }
  end
end
