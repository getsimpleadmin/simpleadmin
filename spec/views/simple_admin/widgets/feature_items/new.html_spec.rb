require 'spec_helper'

RSpec.describe 'simple_admin/widgets/feature_items/new.html.erb', type: :view do
  let(:widget) { build :widget }

  let(:locale) { { locale: :en } }

  before do
    assign(:widget, widget)
    allow(view).to receive(:current_locale).and_return(locale)
  end

  it 'render form' do
    render

    expect(rendered).to have_content 'Create Featured Block'
    expect(rendered).to have_content 'Module name'
    expect(rendered).to have_content 'Module title'
    expect(rendered).to have_content 'Posts'
  end
end
