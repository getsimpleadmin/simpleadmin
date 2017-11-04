require 'spec_helper'

RSpec.describe 'simple_admin/admin/collection/edit.html.erb', type: :view do
  let(:locale) { { locale: :en } }
  let(:entity) { create :entity }

  let(:resource) { create :post }
  let(:resource_title) { 'Редактировать' }

  let!(:entity_fields) do
    number_type = create :entity_field_type, name: :number, template: 'simple_admin/fields/number'
    string_type = create :entity_field_type, name: :string, template: 'simple_admin/fields/string'

    create :entity_field, name: :id, entity_field_type_id: number_type.id, entity_id: entity.id, display: :form
    create :entity_field, name: :title, label: 'Заголовок', entity_field_type_id: string_type.id, entity_id: entity.id, display: :form
    create :entity_field, name: :description, label: 'Описание', entity_field_type_id: string_type.id, entity_id: entity.id, display: :form
  end

  before do
    assign(:resource, resource)
    assign(:entity_fields, entity.entity_fields)

    allow(view).to receive(:resource).and_return(resource)
  end

  before do
    allow_any_instance_of(SimpleAdminHelper).to receive(:current_locale).and_return(locale)
    allow(view).to receive(:params).and_return(locale)

    assign(:resource, resource)
  end

  it_behaves_like :crud_view_form

  it 'render labels' do
    render

    expect(rendered).to have_content 'Заголовок'
    expect(rendered).to have_content 'Описание'
  end
end
