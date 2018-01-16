require 'spec_helper'

RSpec.describe SimpleAdmin::EntityFieldType, type: :model do
  describe '#initialize_helper_methods!' do
    let(:entity_field_type) { build :entity_field_type, name: :example, template: 'simple_admin/fields/example' }

    subject { entity_field_type.save }

    it 'return field helper method' do
      expect(subject).to eq true
      expect(SimpleAdmin::EntityField.respond_to?(:create_example_field)).to eq true
    end
  end

  describe '#view_templates_presence' do
    let(:template) { 'simple_admin/fields/example' }
    let(:entity_field_type) { build :entity_field_type, name: :example, template: template }

    subject { entity_field_type.save }

    it { expect(subject).to eq true }

    context 'when form template missing' do
      let(:template) { 'simple_admin/fields/example_1' }

      it 'return error' do
        expect(subject).to eq false
        expect(entity_field_type.errors.messages[:base]).to eq ['Form template is missing']
      end
    end

    context 'when collection template missing' do
      let(:template) { 'simple_admin/fields/example_2' }

      it 'return error' do
        expect(subject).to eq false
        expect(entity_field_type.errors.messages[:base]).to eq ['Collection template is missing']
      end
    end
  end
end
