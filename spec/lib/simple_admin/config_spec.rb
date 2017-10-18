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

  describe '.menu' do
      before do
        described_class.setup do |config|
          config.menu.configure do
            item do
              label { :example }
              icon  { :example }

              route { :example }
            end
          end
        end
      end

      subject(:menu_items) { described_class.menu_items }

      it 'return menu items' do
        expect(menu_items.first.label).to eq :example
        expect(menu_items.first.icon).to eq :example
        expect(menu_items.first.route).to eq :example
      end
  end
end
