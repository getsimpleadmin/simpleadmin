require 'spec_helper'

RSpec.describe SimpleAdmin::EntityField, type: :model do
  let!(:entity) { create :entity }
  let(:entity_field_type) { create :entity_field_type, name: :string }

  describe '#template_path' do
    let(:entity_field) do
      create :entity_field, name: :title, entity: entity, entity_field_type_id: entity_field_type.id,
                            presentation: :collection
    end

    it 'return template path' do
      expect(entity_field.template_path).to eq 'simple_admin/fields/string/collection'
    end
  end

  describe '#id_field?' do
    let(:entity_field) do
      build :entity_field, name: entity_field_name, entity: entity, entity_field_type_id: entity_field_type.id,
                           presentation: :collection
    end

    subject { entity_field.id_field? }

    context 'when field name description' do
      let(:entity_field_name) { :description }

      it { expect(subject).to eq false }
    end

    context 'when field name id' do
      let(:entity_field_name) { :id }

      it { expect(subject).to eq true }
    end
  end

  describe '#set_label_default_value!' do
    let(:entity_field) do
      build :entity_field, name: :title, entity: entity, entity_field_type_id: entity_field_type.id,
                           presentation: :collection
    end

    subject do
      entity_field.save
      entity_field.reload
    end

    it 'return label default value' do
      expect(subject.label).to eq 'Title'
    end

    context 'when label present' do
      before { entity_field.label = 'SomeLabel' }

      it { expect(subject.label).to eq 'SomeLabel' }
    end
  end

  describe '#name_presentation_uniqueness' do
    let!(:entity_field) do
      create :entity_field, name: :title, entity: entity, entity_field_type_id: entity_field_type.id,
                            presentation: :collection
    end
    let(:entity_field_invalid) do
      build :entity_field, name: :title, entity: entity, entity_field_type_id: entity_field_type.id,
                           presentation: :collection
    end

    it { expect(entity_field_invalid).to_not be_valid }
  end
end
