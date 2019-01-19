require 'rails_helper'

describe ResourceSearchService, type: :service do
  let(:search_query)     { 'Search post' }
  let(:model_klass)      { Post }
  let(:model_attributes) { ['title'] }

  let(:instance) { described_class.new(search_query, model_klass, model_attributes) }

  describe '#run' do
    let!(:posts) { create_list :post, 10 }
    let!(:post)  { create :post, title: search_query }

    subject { instance.run }

    it 'found resource' do
      expect(subject.resources.to_a).to eq [post]
    end
  end
end
