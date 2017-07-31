require 'spec_helper'

RSpec.describe 'simple_admin/admin/system/entity_field_types/new.html.erb', type: :view do
  let(:resource) { build :entity_field_type }
  let(:resource_title) { I18n.t('simple_admin.admin.system.entity_field_types.new.title') }

  it_behaves_like :crud_view_form
end
