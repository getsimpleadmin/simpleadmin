require 'spec_helper'

RSpec.describe SimpleAdmin::User, type: :model do
  describe '#create_profile!' do
    let(:user) { build :user }
    let(:profile) { user.profile }

    subject { user.save }

    it { expect { subject }.to change { SimpleAdmin::Profile.count }.by(1) }

    it 'return profile' do
      subject
      expect(profile.user).to eq user
    end
  end
end
