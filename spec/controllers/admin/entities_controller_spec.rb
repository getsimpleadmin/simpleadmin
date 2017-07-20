require 'spec_helper'

RSpec.describe Admin::EntitiesController, type: :controller do
  describe '#index' do
    let!(:entities) { create_list :entity, 5 }

    subject { get :index }

    it 'render entities' do
      expect(subject.status).to eq 200
      expect(assigns(:resources)).to eq entities
    end
  end

  describe '#edit' do
    let(:entity) { create :entity }
    let(:params) do
      {
        id: entity.id
      }
    end

    subject { get :edit, params: params }

    it 'render entity' do
      expect(subject.status).to eq 200
      expect(assigns(:resource)).to eq entity
    end
  end

  describe '#update' do
    let(:entity) { create :entity, name: 'Posts' }
    let(:params) do
      {
        id: entity.id,
        simple_admin_entity: { name: 'Test' }
      }
    end

    subject { patch :update, params: params }

    it 'update entity' do
      expect(subject).to redirect_to admin_entities_path
      expect(assigns(:resource)).to eq entity

      expect(entity.reload.name).to eq 'Test'
    end
  end

  describe '#create' do
    let(:entity) { build :entity }

    let(:params) do
      {
        simple_admin_entity: { name: 'Post' }
      }
    end

    subject { post :create, params: params }

    it 'create entity' do
      expect { subject }.to change { SimpleAdmin::Entity.count }.by(1)
      expect(subject).to redirect_to admin_entities_path
    end
  end

  describe '#destroy' do
    let!(:entity) { create :entity }
    let(:params) do
      {
        id: entity.id,
      }
    end

    subject { delete :destroy, params: params }

    it 'delete entity' do
      expect { subject }.to change { SimpleAdmin::Entity.count }.by(-1)
      expect(subject).to redirect_to admin_entities_path
    end
  end

end
