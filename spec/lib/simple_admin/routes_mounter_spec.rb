require 'spec_helper'
require 'simple_admin/routes_mounter'

RSpec.describe SimpleAdmin::RoutesMounter do
  let(:routing_mapper) { double }

  describe '.mount_system_routes!' do
    let(:menu_route) { build :menu_route }
    let(:menu_system_routes) { [menu_route] }

    before do
      expect(described_class).to receive(:menu_system_routes).and_return(menu_system_routes)
      expect(routing_mapper).to receive(:public_send).with(:resources, :settings, { only: %i[index update] })
    end

    subject { described_class.mount_system_routes!(routing_mapper) }

    # it 'returs mounter routes' do
    #   subject
    #
    #   expect(m)
    # end
    it { subject }

    context 'when params empty' do
    end
  end
end
