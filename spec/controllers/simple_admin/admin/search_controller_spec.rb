require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::SearchController, type: :controller do
  let(:user) { create :user, :with_role, user_role: :admin }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe '#index' do
    let(:params) { {} }

    subject { get :index, params: params }

    it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }

    context 'when posts searching' do
      let!(:post) { create :post, title: 'Hello world!', user: user }

      let(:params) do
        {
          query: 'Hell',
          resource_klass: 'Post'
        }
      end

      before do
        post_entity = SimpleAdmin::Entity.create(model_klass_name: Post.to_s, label: 'Posts', status: true)

        SimpleAdmin::EntityField.create_string_field(name: :title, entity: post_entity, sort_order: 1, presentation: :collection, search_indexable: true)
        SimpleAdmin::EntityField.create_string_field(name: :description, entity: post_entity, sort_order: 2, presentation: :collection)
      end

      it 'return resources' do
        expect(subject.status).to eq 200
        expect(assigns(:resources).to_a).to eq [post]
      end
    end
  end
end
