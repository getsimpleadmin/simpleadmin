require 'spec_helper'

RSpec.describe 'simple_admin/admin/system/entity_field_types/index.html.erb', type: :view do
  let(:resources) { create_list :entity_field_type, 1 }
  let(:resource_title) { I18n.t('simple_admin.admin.system.entity_field_types.index.title') }

  let(:resource_attributes) { [:id, :name, :template] }

  it_behaves_like :crud_view_collection
end
