require 'spec_helper'

RSpec.describe 'admin/system/entities/new.html.erb', type: :view do
  let(:resource) { build :entity }
  let(:resource_title) { I18n.t('admin.system.entities.new.title') }

  it_behaves_like :crud_view_form
end
