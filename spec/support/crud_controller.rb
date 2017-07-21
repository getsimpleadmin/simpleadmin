shared_examples :crud_testing do
  describe '#index' do
    subject { get :index }

    it 'render resources' do
      expect(subject.status).to eq 200
      expect(assigns(:resources)).to eq resources
    end
  end

  describe '#edit' do
    let(:params) do
      {
        id: resource.id
      }
    end

    subject { get :edit, params: params }

    it 'render resource' do
      expect(subject.status).to eq 200
      expect(assigns(:resource)).to eq resource
    end
  end

  describe '#update' do
    subject { patch :update, params: resource_params }

    it 'update resource' do
      expect(subject).to redirect_to resource_path
      expect(assigns(:resource)).to eq resource

      expect(resource.reload.public_send(resource_attributes[:name])).to eq resource_attributes[:value]
    end
  end

  describe '#create' do
    subject { post :create, params: resource_params }

    it 'create resource' do
      expect { subject }.to change { resource.class.count }.by(1)
      expect(subject).to redirect_to resource_path
    end
  end

  describe '#destroy' do
    let(:params) do
      {
        id: resource.id,
      }
    end

    subject { delete :destroy, params: params }

    it 'delete resource' do
      expect { subject }.to change { resource.class.count }.by(-1)
      expect(subject).to redirect_to resource_path
    end
  end
end
