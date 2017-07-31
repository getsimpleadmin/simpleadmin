require 'spec_helper'

require 'simple_admin/resource_actions'

RSpec.describe SimpleAdmin::ResourceActions do
  describe '.initialize_controller_actions!' do
    let(:controller_klass) { SimpleAdmin::Admin::ExamplesController }
    let(:collection_name) { :examples }

    let(:controller_instance) { controller_klass.new }

    before { SimpleAdmin::Admin.const_set('ExamplesController', Class.new(SimpleAdmin::Admin::BaseController)) }
    before { SimpleAdmin.const_set('Example', Class.new) }

    subject { described_class.initialize_controller_actions!(controller_klass, 'SimpleAdmin::Post', collection_name) }

    it 'return controller methods' do
      subject

      expect(controller_klass.instance_methods.include?(:initialize_index_resources)).to eq true
      expect(controller_klass.instance_methods.include?(:collection_name)).to eq true
      expect(controller_klass.instance_methods.include?(:model_klass)).to eq true

      expect(controller_instance.model_klass).to eq SimpleAdmin::Post
      expect(controller_instance.collection_name).to eq :examples
    end
  end
end
