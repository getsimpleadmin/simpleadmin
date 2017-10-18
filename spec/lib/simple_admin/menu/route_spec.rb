require 'spec_helper'
require 'simple_admin/menu/route'

RSpec.describe SimpleAdmin::Menu::Route do
  let(:method_name)   { :resources }
  let(:resource_name) { :settings }

  let(:params) do
    {
      only: %i[index update]
    }
  end

  let(:args) { [resource_name, params] }

  subject(:route) { described_class.new(method_name, *args) }

  it 'return route attributes' do
    expect(route.method_name).to eq method_name
    expect(route.resource_name).to eq resource_name
    expect(route.params).to eq params
  end
end
