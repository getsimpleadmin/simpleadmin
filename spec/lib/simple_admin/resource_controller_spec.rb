require 'spec_helper'

require 'simple_admin/resource_controller'

RSpec.describe SimpleAdmin::ResourceController do
  let(:instance) { described_class.new(collection_name) }

  describe '#initialize_controller_klass!' do
    let(:collection_name) { :tests }

    subject { instance.initialize_controller_klass! }

    it 'return initialized controller class' do
      klass = subject

      expect(klass).to eq SimpleAdmin::Admin::TestsController
      expect(klass.superclass).to eq SimpleAdmin::Admin::BaseController
    end
  end

  describe '#controller_klass_name' do
    let(:collection_name) { :posts }

    before do
      SimpleAdmin::Admin.const_set('PostsController', Class.new(SimpleAdmin::Admin::BaseController))
    end

    subject { instance.controller_klass_name }

    it 'return controller class' do
      expect(subject).to eq SimpleAdmin::Admin::PostsController
    end
  end
end
