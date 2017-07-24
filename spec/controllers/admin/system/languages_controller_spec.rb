require 'spec_helper'

RSpec.describe Admin::System::LanguagesController, type: :controller do
  let(:resource) { create :language }
  let(:resources) { create_list :language, 1 }

  let(:resource_path) { admin_system_languages_path(current_locale) }
  let(:resource_attributes) do
    {
      name: :name,
      value: 'Test'
    }
  end

  let(:resource_params) do
    {
      id: resource.id,
      simple_admin_language: { name: resource_attributes[:value] }
    }
  end

  it_behaves_like :crud_testing
end
