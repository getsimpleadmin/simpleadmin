require 'spec_helper'

RSpec.describe 'simple_admin/admin/collection/index.html.erb', type: :view do
  let(:locale) { { locale: :en } }
  let!(:entity) { create :entity }

  let!(:resources) { create_list :post, 1 }
  let!(:resource_title) { I18n.t('simple_admin.admin.posts.index.title') }

  let!(:entity_fields) do
    number_type = create :entity_field_type, name: :number, template: 'simple_admin/fields/number'
    string_type = create :entity_field_type, name: :string, template: 'simple_admin/fields/string'

    create :entity_field, name: :id, label: :id, entity_field_type_id: number_type.id, entity_id: entity.id, display: :index
    create :entity_field, name: :title, label: 'Заголовок', entity_field_type_id: string_type.id, entity_id: entity.id, display: :index
    create :entity_field, name: :description, label: 'Описание', entity_field_type_id: string_type.id, entity_id: entity.id, display: :index
  end

  let(:resource_attributes) { [:id, :title, :description] }

  before do
    assign(:collection_name, :posts)
    assign(:model_instance, SimpleAdmin::Post.new)
    assign(:entity_fields, entity.entity_fields)
  end


  before do
    allow_any_instance_of(SimpleAdminHelper).to receive(:current_locale).and_return(locale)
    allow(view).to receive(:params).and_return(locale)

    assign(:resources, resources)
  end

  it_behaves_like :crud_view_collection

  it 'render labels' do
    render

    expect(rendered).to have_content 'Заголовок'
    expect(rendered).to have_content 'Описание'
  end
end
