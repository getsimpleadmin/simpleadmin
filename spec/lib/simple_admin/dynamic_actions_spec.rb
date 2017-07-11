require 'spec_helper'

require 'app/controllers/admin/base_controller'
require 'simple_admin/dynamic_actions'

RSpec.describe SimpleAdmin::DynamicActions do
  describe '.set!' do
    let(:klass_name) { Admin::ExamplesController }
    let(:collection_name) { :examples }

    before { Admin.const_set('ExamplesController', Class.new(Admin::BaseController)) }
    before { SimpleAdmin.const_set('Example', Class.new) }

    subject { described_class.set!(klass_name, collection_name) }

    it 'generate controller with actions' do
      subject

      expect(Admin::ExamplesController.instance_methods(false).include?(:index)).to eq true
      expect(Admin::ExamplesController.instance_methods(false).include?(:show)).to eq true
    end
  end
end
