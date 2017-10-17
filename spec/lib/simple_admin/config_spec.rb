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
      let(:label) { :example }
      let(:icon)  { :example }

      let(:route) { double }

      before do
        described_class.setup do |config|
          config.menu.configure do
            menu_item do
              label { label }
              icon  { icon }

              route { route }
            end
          end
        end
      end

      subject { described_class.menu.items }

      it 'return menu items' do
      end
  end
end
