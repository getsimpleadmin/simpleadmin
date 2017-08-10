require 'spec_helper'

RSpec.describe SimpleAdmin do
  describe '.setup!' do
    before { subject }

    subject { described_class.setup! }

    describe 'TrueClass#humanize' do
      let(:boolean) { true }

      it 'return humanized value' do
        expect(boolean.humanize).to eq :Yes
      end
    end

    describe 'FalseClass#humanize' do
      let(:boolean) { false }

      it 'return humanized value' do
        expect(boolean.humanize).to eq :No
      end
    end

    describe 'ApplicationRecord#get_field' do
      let(:model) { create :language }

      it 'return field' do
        expect(model.get_field(:name)).to eq model.name
      end
    end
  end
end
