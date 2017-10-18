require 'spec_helper'
require 'simple_admin/search'

RSpec.describe SimpleAdmin::Search do
  let(:user) { create :user }
  let!(:resource) { create :post, title: 'Hello world!', user: user }

  let(:search_query) { 'Hello' }
  let(:resource_klass) { Post }

  subject { described_class.new(search_query, resource_klass).process }

  it 'return empty result' do
    expect(subject).to eq []
  end

  context 'when entity exist' do
    let(:entity) { create :entity, model_klass_name: Post.to_s }

    before do
      SimpleAdmin::EntityField.create_string_field(name: :title, entity: entity, sort_order: 1, presentation: :collection,
                                                   search_indexable: true)
      SimpleAdmin::EntityField.create_string_field(name: :description, entity: entity, sort_order: 2, presentation: :collection,
                                                   search_indexable: true)
    end

    it 'return searchable resource' do
      expect(subject).to eq [resource]
    end
  end
end
