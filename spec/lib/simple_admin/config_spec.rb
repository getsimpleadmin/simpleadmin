require 'spec_helper'
require 'simple_admin/config'

RSpec.describe SimpleAdmin::Config do
  describe '.per_page' do
    let(:per_page) { 10 }

    before do
      described_class.setup do |config|
        config.per_page = per_page
      end
    end

    subject { described_class.per_page }

    it 'return per page' do
      expect(subject).to eq per_page
    end
  end
end
