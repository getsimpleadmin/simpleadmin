require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::Design::LayoutsController, type: :controller do
  let(:resource) { create :layout }

  let(:redirect_path) { admin_design_layouts_path }

  let(:resource_attributes) do
    {
      name: :name,
      value: 'Category'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_layout: { name: resource_attributes[:value] }
    }
  end

  it_behaves_like :controller_crud
end
