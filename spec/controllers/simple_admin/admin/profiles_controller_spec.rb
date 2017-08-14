require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::ProfilesController, type: :controller do
  describe '#edit' do
    let(:user) { create :user }
    let(:params) do
      {
        id: user.id
      }
    end

    subject { get :edit, params: params }

    it { subject }
  end
end
