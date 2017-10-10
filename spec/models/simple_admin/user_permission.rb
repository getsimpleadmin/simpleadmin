require 'spec_helper'

RSpec.describe SimpleAdmin::UserPermission, type: :model do
  describe '#resource_uniqueness' do
    let(:role) { create :role }

    let!(:user_permission) { create :user_permission, role: role }
    let(:user_permission_invalid) { build :user_permission, role: role }

    subject { user_permission_invalid.save }

    it { expect(user_permission_invalid).to_not be_valid }
  end
end
