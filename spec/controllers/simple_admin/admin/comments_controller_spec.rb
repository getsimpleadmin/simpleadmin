require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::CommentsController, type: :controller do
  let(:user) { create :user }
  let(:resource) { create :comment, user: user }

  let(:after_update_path) { admin_comments_path }
  let(:after_create_path) { admin_comments_path }
  let(:after_destroy_path) { admin_comments_path }

  let(:resource_attributes) do
    {
      name: :message,
      value: 'Hello world!'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_comment: { message: resource_attributes[:value], user_id: user.id }
    }
  end

  before do
    entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Comment.to_s, status: true)

    SimpleAdmin::EntityField.create_string_field(name: :message, entity: entity, sort_order: 1, presentation: :form)
    SimpleAdmin::EntityField.create_number_field(name: :user_id, entity: entity, sort_order: 2, presentation: :form)
  end

  it_behaves_like :controller_crud
end
