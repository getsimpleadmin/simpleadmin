require 'rails_helper'

describe EntityService, type: :service do
  let(:instance) { described_class.new }

  before { Rails.application.eager_load! }

  describe '#index_action' do
    let(:response) do
      {
        models: [
          {
            name: 'Post',
            columns: [
              { name: 'id', type: 'integer' },
              { name: 'title', type: 'character_varying' },
              { name: 'description', type: 'character_varying' },
              { name: 'created_at', type: 'timestamp_without_time_zone' },
              { name: 'updated_at', type: 'timestamp_without_time_zone' }
            ]
          }
        ]
      }
    end

    subject { instance.index_action }

    it 'returns application models' do
      expect(subject).to eq response
    end
  end

  describe '#show_action' do
    let(:resource_klass) { Post }

    let(:response) do
      {
        name:         resource_klass.name,
        column_names: resource_klass.column_names,
        columns:      resource_klass.columns.map { |column| { name: column.name, type: column.sql_type.parameterize.underscore } },
        reflections:  resource_klass.reflections.keys
      }
    end

    subject { instance.show_action(resource_klass) }

    it 'returns model details' do
      expect(subject).to eq response
    end
  end
end
