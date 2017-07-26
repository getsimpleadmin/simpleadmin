require 'spec_helper'

require 'app/controllers/admin/base_controller'
require 'simple_admin/resource_controller'

RSpec.describe SimpleAdmin::ResourceController do
  let(:instance) { described_class.new(collection_name) }

  describe '#initialize_controller_klass!' do
    let(:collection_name) { :tests }

    subject { instance.initialize_controller_klass! }

    it 'return initialized controller class' do
      klass = subject

      expect(klass).to eq Admin::TestsController
      expect(klass.superclass).to eq Admin::BaseController
    end
  end

  describe '#controller_klass_name' do
    let(:collection_name) { :posts }

    before do
      Admin.const_set('PostsController', Class.new(Admin::BaseController))
    end

    subject { instance.controller_klass_name }

    it 'return controller class' do
      expect(subject).to eq Admin::PostsController
    end
  end
end
