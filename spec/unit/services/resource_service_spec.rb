require 'rails_helper'

describe ResourceService, type: :service do
  let(:model_klass)  { Post }
  let(:model_fields) do
    %w[
      id title description
    ]
  end

  let(:instance) { described_class.new(model_klass, model_fields) }

  describe '#index_action' do
    let!(:post) { create :post }

    let(:per_page) { 10 }
    let(:page)     { 1 }
    let(:sort)     { nil }
    let(:query)    { nil }

    let(:model_attributes)   { nil }
    let(:reflection_tables)  { nil }
    let(:reflection_columns) { nil }

    let(:response) do
      {
        resources: [
          {
            'id'    => post.id,
            'title' => post.title,
            'description' => post.description
          }
        ], total: 1
      }
    end

    subject { instance.index_action(per_page, page, sort, query, model_attributes, reflection_tables, reflection_columns) }

    it 'returns resources' do
      expect(subject).to eq response
    end
  end
end
