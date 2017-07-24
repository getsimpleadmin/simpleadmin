require 'spec_helper'
require 'simple_admin/support/crud_controller_helper'

class Admin::PostsController < ActionController::Base; end

RSpec.describe Admin::PostsController, type: :controller do
  controller do
    include SimpleAdmin::CrudControllerHelper

    def model_klass
      SimpleAdmin::Post
    end

    def redirect_path
      admin_posts_path
    end

    private

    def resource_params
      params.require(:simple_admin_post).permit(:title, :category_id)
    end
  end

  let(:category) { create :category }

  let(:resource)  { create :post, category_id: category.id }
  let(:resources) { create_list :post, 1, category_id: category.id }

  let(:resource_path) { admin_posts_path }
  let(:resource_attributes) do
    {
      name: :title,
      value: 'Test'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_post: { category_id: category.id, title: resource_attributes[:value] }
    }
  end

  it_behaves_like :crud_testing
end
