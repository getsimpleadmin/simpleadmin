require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::ProfilesController, type: :controller do
  let(:user) { create :user }

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
          email: 'somenewemail@example.com',
          profile_attributes: {
            first_name: 'Alex',
            last_name: 'Doe',
            twitter_nickname: '@alexdoe'
          }
        }
      }
    end

    subject { patch :update, params: params }

    it 'update user profile' do
      expect(subject).to redirect_to admin_root_path(current_locale)
      expect(flash[:notice]).to eq I18n.t('simple_admin.admin.profiles.update.success')

      expect(user.reload.first_name).to eq 'Alex'
      expect(user.last_name).to eq 'Doe'
      expect(user.twitter_nickname).to eq '@alexdoe'
    end
  end
end
