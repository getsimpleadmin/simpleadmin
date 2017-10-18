require 'spec_helper'
require 'simple_admin/menu/item'

RSpec.describe SimpleAdmin::Menu::Item do
  let(:item_block) do
    proc do
      label { :example }
      icon  { :example }

      route { :example }
    end
  end

  subject(:menu_item) { described_class.new(&item_block) }

  it 'returns menu item' do
    expect(menu_item.icon).to eq :example
    expect(menu_item.label).to eq :example
    expect(menu_item.route).to eq :example
  end
end
