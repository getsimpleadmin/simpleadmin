require 'spec_helper'
require 'simple_admin/routes_mounter'

RSpec.describe SimpleAdmin::RoutesMounter do
  let(:routing_mapper) { double }

  describe '.mount_system_routes!' do
    let(:menu_route) { build :menu_route }
    let(:menu_system_routes) { [menu_route] }

    before do
      allow(described_class).to receive(:menu_system_routes).and_return(menu_system_routes)
    end

    subject { described_class.mount_system_routes!(routing_mapper) }

    it 'return mounted routes' do
      expect(routing_mapper).to receive(:public_send).with(:resources, :settings, only: %i[index update])
      subject
    end

    context 'when params empty' do
      let(:menu_route) { build :menu_route, params: nil }

      it 'replace params with empty hash' do
        expect(routing_mapper).to receive(:public_send).with(:resources, :settings, {})
        subject
      end
    end

    context 'when menu_system_routes empty' do
      before do
        allow(described_class).to receive(:menu_system_routes).and_return(nil)
      end

      it { expect(subject).to eq nil }
    end
  end
end
