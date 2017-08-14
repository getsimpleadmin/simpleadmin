require 'spec_helper'

RSpec.describe 'simple_admin/admin/profiles/edit.html.erb', type: :view do
  let(:locale) { { locale: :en } }
  let(:user) { create :user }

  before do
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive(:current_locale).and_return(locale)
  end

  it 'render profile' do
    render

    expect(rendered).to have_content 'Edit profile'

    expect(rendered).to have_content 'Social networks'
    expect(rendered).to have_content 'Email'
    expect(rendered).to have_content 'First name'
    expect(rendered).to have_content 'Last name'
    expect(rendered).to have_content 'Avatar'
    expect(rendered).to have_content 'Twitter'
  end
end
