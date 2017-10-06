shared_examples :controller_dynamic_crud do
  let(:user) { create :user, :with_role, user_role: :admin }

  before do
    sign_in user
  end

  describe '#create' do
    subject { xhr :post, :create, params: resource_params }

    it { expect { subject }.to change { resource.class.count }.by(1) }
  end

  describe '#update' do
    subject { xhr :put, :update, params: resource_params }

    it 'update resource' do
      subject
      expect(resource.reload.public_send(resource_attributes[:name])).to eq resource_attributes[:value]
    end
  end

  describe '#destroy' do
    let(:params) do
      {
        id: resource.id,
      }
    end

    subject { xhr :delete, :destroy, params: params }

    it 'destroy resource' do
      subject
      expect { resource.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
