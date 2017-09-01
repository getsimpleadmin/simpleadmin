require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::PostsController, type: :controller do
  let(:user) { create :user }
  let(:resource) { create :post, user: user }

  let(:redirect_path) { admin_posts_path }

  let(:resource_attributes) do
    {
      name: :title,
      value: 'Hello world!'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_post: { title: resource_attributes[:value], user_id: user.to_param }
    }
  end

  before do
    post_entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Post.to_s, label: 'Posts', status: true)

    SimpleAdmin::EntityField.create_string_field(name: :title, entity: post_entity, sort_order: 1, presentation: :form)
    SimpleAdmin::EntityField.create_number_field(name: :user_id, entity: post_entity, sort_order: 1, presentation: :form)
  end

  it_behaves_like :controller_crud
end
