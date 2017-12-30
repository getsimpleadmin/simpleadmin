require 'spec_helper'
require 'rails/generators'
require 'generators/simple_admin/model_entities_generator'

RSpec.describe SimpleAdmin::Generators::ModelEntitiesGenerator, type: :generator do
  describe 'simple_admin:model_entities create new entity' do
    let(:name) { ['Post'] }

    context 'without option fields' do
      subject { described_class.new(name).handle_entity }

      it 'creates entity and entity field' do
        expect { subject }.to change { SimpleAdmin::Entity.count }.by(1)
                                  .and change { SimpleAdmin::EntityField.count }.by(3)
      end
    end

    context 'with option fields' do
      let(:options) { { fields: { title: 'string', description: 'string', created_at: 'string' } } }
      subject { described_class.new(name, options).handle_entity }

      it 'creates entity and entity field' do
        expect { subject }.to change { SimpleAdmin::Entity.count }.by(1)
                                  .and change { SimpleAdmin::EntityField.count }.by(4)
      end
    end
  end

  describe 'simple_admin:model_entities update entity' do
    let!(:entity) { create(:entity) }
    let(:name) { ['Post'] }

    context 'without option fields' do
      subject { described_class.new(name).handle_entity }

      it 'doesnt create new entity' do
        expect { subject }.not_to change { SimpleAdmin::Entity.count }
      end
    end

    context 'with option fields' do
      let(:options) { { fields: { created_at: 'string' } } }
      subject { described_class.new(name, options).handle_entity }

      it 'doesnt create new entity' do
        expect { subject }.not_to change { SimpleAdmin::Entity.count }
      end

      it 'creates one new field' do
        expect { subject }.to change { SimpleAdmin::EntityField.count }.by(1)
      end
    end
  end
end
