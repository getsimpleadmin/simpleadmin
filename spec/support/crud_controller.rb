shared_examples :controller_crud do
  let(:user) { create :user, :with_role, user_role: :admin }

  before { sign_in user }

  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(200) }
  end

  describe '#edit' do
    let(:params) do
      {
        id: resource.id
      }
    end

    subject { get :edit, params: params }

    it { is_expected.to have_http_status(200) }
  end

  describe '#update' do
    subject { patch :update, params: resource_params }

    it 'update resource' do
      expect(subject).to redirect_to after_update_path
      expect(assigns(:resource)).to eq resource

      expect(resource.reload.public_send(resource_attributes[:name])).to eq resource_attributes[:value]
    end
  end

  describe '#create' do
    subject { post :create, params: resource_params }

    it 'create resource' do
      expect { subject }.to change { resource.class.count }.by(1)

      expect(subject).to redirect_to after_create_path
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

      expect(subject).to redirect_to after_destroy_path
    end
  end
end
