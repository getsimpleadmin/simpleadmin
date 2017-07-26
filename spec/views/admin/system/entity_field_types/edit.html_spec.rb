require 'spec_helper'

RSpec.describe 'admin/system/entity_field_types/edit.html.erb', type: :view do
  let(:resource) { create :entity_field_type }
  let(:resource_title) { I18n.t('admin.system.entity_field_types.edit.title') }

  it_behaves_like :crud_view_form
end
