require 'spec_helper'

RSpec.describe SimpleAdmin::EntityField, type: :model do
  describe '#template_path' do
    let!(:entity) { create :entity }

    let!(:entity_field_type) { create :entity_field_type, name: :number, template: 'fields/number' }
    let!(:entity_field) { create :entity_field, entity_id: entity.id, entity_field_type_id: entity_field_type.id, display: :index }

    it 'return template path' do
      expect(entity_field.template_path).to eq 'fields/number/index'
    end
  end
end
