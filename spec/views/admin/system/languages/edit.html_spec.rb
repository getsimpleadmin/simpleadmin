require 'spec_helper'

RSpec.describe 'admin/system/languages/edit.html.erb', type: :view do
  let(:resource) { create :language }
  let(:resource_title) { I18n.t('admin.system.languages.edit.title') }

  it_behaves_like :crud_view_form
end
