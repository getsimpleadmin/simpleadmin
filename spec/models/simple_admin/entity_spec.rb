require 'spec_helper'

RSpec.describe SimpleAdmin::Entity, type: :model do
  describe '#label_default_value!' do
     let(:entity) { build :entity, model_klass_name: 'SimpleAdmin::User' }

     subject { entity.save }

     it 'return label default value' do
       subject
       expect(entity.label).to eq 'Users'
     end
  end

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
