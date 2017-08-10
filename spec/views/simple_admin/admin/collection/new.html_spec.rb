require 'spec_helper'

RSpec.describe 'simple_admin/admin/collection/new.html.erb', type: :view do
  let(:entity) { create :entity }

  let(:resource) { build :post }
  let(:resource_title) { 'Создать' }

  let!(:entity_fields) do
    number_type = create :entity_field_type, name: :number, template: 'simple_admin/fields/number'
    string_type = create :entity_field_type, name: :string, template: 'simple_admin/fields/string'

    create :entity_field, name: :id, entity_field_type_id: number_type.id, entity_id: entity.id, display: :index
    create :entity_field, name: :title, entity_field_type_id: string_type.id, entity_id: entity.id, display: :index
    create :entity_field, name: :description, entity_field_type_id: string_type.id, entity_id: entity.id, display: :index
  end

  before do
    assign(:resource, resource)
    assign(:entity_fields, entity.entity_fields)

    allow(view).to receive(:resource).and_return(resource)
  end

  it_behaves_like :crud_view_form
end
