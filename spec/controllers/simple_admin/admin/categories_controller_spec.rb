require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::CategoriesController, type: :controller do
  let(:resource) { create :category }

  let(:redirect_path) { admin_categories_path }

  let(:resource_attributes) do
    {
      name: :title,
      value: 'Popular'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_category: { title: resource_attributes[:value] }
    }
  end

  before do
    category_entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Category.to_s, status: true)

    SimpleAdmin::EntityField.create_string_field(name: :title, entity: category_entity, sort_order: 1, presentation: :form)
  end

  it_behaves_like :controller_crud
end
