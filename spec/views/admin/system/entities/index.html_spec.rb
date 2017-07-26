require 'spec_helper'

RSpec.describe 'admin/system/entities/index.html.erb', type: :view do
  let(:resources) { create_list :entity, 1 }
  let(:resource_title) { I18n.t('admin.system.entities.index.title') }

  let(:resource_attributes) { [:id, :model_klass_name] }

  it_behaves_like :crud_view_collection
end
