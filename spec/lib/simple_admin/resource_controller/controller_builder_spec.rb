require 'spec_helper'
require 'simple_admin/resource_controller/controller_builder'

RSpec.describe SimpleAdmin::ResourceController::ControllerBuilder do
  let(:controller_builder) { described_class.new(resource_name) }

  describe '#initialize' do
    let(:resource_name) { 'examples' }

    subject { controller_builder.instance_variable_get(:@controller_name) }

    it 'return controller name' do
      expect(subject).to eq 'ExamplesController'
    end
  end

  describe '#build!' do
    let(:resource_name) { 'examples' }

    before do
      SimpleAdmin::Admin.send(:remove_const, :ExamplesController)
    end

    subject { controller_builder.build! }

    it 'return controller class' do
      expect(subject).to eq SimpleAdmin::Admin::ExamplesController
    end
  end

  describe '#controller_klass' do
    let(:resource_name) { 'examples' }

    before do
      controller_builder.build!
    end

    subject { controller_builder.controller_klass }

    it 'return controller class' do
      expect(subject).to eq SimpleAdmin::Admin::ExamplesController
    end
  end
end
