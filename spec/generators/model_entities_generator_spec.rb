require 'spec_helper'
require 'rails/generators'
require 'generators/simple_admin/model_entities_generator'

RSpec.describe SimpleAdmin::Generators::ModelEntitiesGenerator, type: :generator do
  let(:instance) { described_class.new(args) }

  describe '#generate' do
    let(:entity) { SimpleAdmin::Entity.find_by(model_klass_name: name) }

    let(:name) { 'Post' }
    let(:args) { [name] }

    subject { instance.generate }

    it 'create entity and entity fields' do
      expect { subject }.to change { SimpleAdmin::Entity.count }.by(1)
                                .and change { SimpleAdmin::EntityField.count }.by(5)

      expect(entity.entity_fields.collection.pluck(:name)).to eq ['id', 'title', 'description']
      expect(entity.entity_fields.form.pluck(:name)).to eq ['title', 'description']
    end
  end
end
