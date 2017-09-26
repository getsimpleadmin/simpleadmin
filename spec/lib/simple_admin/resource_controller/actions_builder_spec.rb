require 'spec_helper'

require 'simple_admin/resource_controller/controller_builder'
require 'simple_admin/resource_controller/actions_builder'

require 'simple_admin/helpers/url_helper'

RSpec.describe SimpleAdmin::ResourceController::ActionsBuilder do
  describe '.initialize_actions' do
    let(:controller_builder) { SimpleAdmin::ResourceController::ControllerBuilder.new('examples') }
    let(:model_name) { 'Examples' }

    let(:controller_klass) { SimpleAdmin::Admin::ExamplesController }

    before { controller_builder.build! }
    before { class Examples; end }

    subject { described_class.initialize_actions!(controller_builder.controller_klass, model_name) }

    it 'return controller with CRUD actions' do
      subject

      expect(controller_klass.new).respond_to?(:index)
      expect(controller_klass.new).respond_to?(:new)
      expect(controller_klass.new).respond_to?(:create)

      expect(controller_klass.new).respond_to?(:edit)
      expect(controller_klass.new).respond_to?(:update)
      expect(controller_klass.new).respond_to?(:destroy)

      expect(controller_klass.new.model_klass).to eq Examples
    end
  end
end
