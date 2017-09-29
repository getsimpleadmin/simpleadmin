require 'spec_helper'

RSpec.describe SimpleAdmin::Entity, type: :model do
  describe '#create_default_fields' do
    let(:entity) { build :entity }

    subject { entity.save }

    it { expect { subject }.to change { entity.entity_fields.count }.by(1) }

    it 'return field' do
      subject
      expect(entity.entity_fields.first.name).to eq 'id'
    end
  end
end
