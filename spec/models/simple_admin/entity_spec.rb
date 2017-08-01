require 'spec_helper'

RSpec.describe SimpleAdmin::Entity, type: :model do
  describe '.set_model_plural_name!' do
    let(:entity) { build :entity, model_klass_name: model_klass_name, model_plural_name: '' }

    context 'when model class name post' do
      let(:model_klass_name) { 'SimpleAdmin::Post' }

      it 'retuns plural core name' do
        entity.save
        expect(entity.reload.model_plural_name).to eq SimpleAdmin::Post.plural_name.to_s
      end
    end

    context 'when model class name category' do
      let(:model_klass_name) { 'SimpleAdmin::Category' }

      it 'retuns plural core name' do
        entity.save
        expect(entity.reload.model_plural_name).to eq SimpleAdmin::Category.plural_name.to_s
      end
    end
  end
end
