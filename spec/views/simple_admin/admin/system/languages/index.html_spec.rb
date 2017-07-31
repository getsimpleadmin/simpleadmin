require 'spec_helper'

RSpec.describe 'simple_admin/admin/system/languages/index.html.erb', type: :view do
  let(:resources) { create_list :language, 1 }
  let(:resource_title) { I18n.t('simple_admin.admin.system.languages.index.title') }

  let(:resource_attributes) { [:id, :name, :code] }

  it_behaves_like :crud_view_collection
end
