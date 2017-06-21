require 'spec_helper'

require 'app/controllers/admin/base_controller'
require 'simple_admin/dynamic_controllers'

RSpec.describe SimpleAdmin::DynamicControllers do
  let(:instance) { described_class.new(collection_name) }

  describe '#set!' do
    let(:collection_name) { :posts }

    subject { instance.set! }

    it { expect(subject).to eq Admin::PostsController }
    it { expect(subject.superclass).to eq Admin::BaseController }
  end

  describe '#get_klass_name' do
    let(:collection_name) { :posts }

    before { Admin.const_set('PostsController', Class.new(Admin::BaseController)) }

    subject { instance.get_klass_name }

    it { expect(subject).to eq Admin::PostsController }
  end
end
