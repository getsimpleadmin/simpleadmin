require 'spec_helper'

RSpec.describe 'simple_admin/admin/system/entities/edit.html.erb', type: :view do
  let(:resource) { create :entity }
  let(:resource_title) { I18n.t('simple_admin.admin.system.entities.edit.title') }

  it_behaves_like :crud_view_form
end
