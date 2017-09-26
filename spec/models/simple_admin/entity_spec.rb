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

  describe '#validate_inbuilt' do
    let!(:entity) { create :entity, inbuilt: true }

    subject { entity.destroy }

    it 'return error' do
      expect(subject).to eq false
      expect(entity.errors.messages[:base]).to eq ['Can not delete system entity']
    end
  end
end
