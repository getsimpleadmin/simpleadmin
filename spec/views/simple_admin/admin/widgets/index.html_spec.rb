require 'spec_helper'

RSpec.describe 'simple_admin/admin/widgets/index.html.erb', type: :view do
  let!(:widget_type) { create :widget_type, name: :featured, status: widget_status }
  let!(:widget) { create :widget, name: :featured_home, label: 'Featured | Home', widget_type_id: widget_type.id }

  let(:widget_status) { true }
  let(:locale) { { locale: :en } }

  before do
    assign(:widget_types, SimpleAdmin::WidgetType.all)
    allow(view).to receive(:current_locale).and_return(locale)
  end

  it 'render widget' do
    render

    expect(rendered).to have_content 'Plugins / Extensions'

    expect(rendered).to have_content 'featured'
    expect(rendered).to have_content 'Add'
    expect(rendered).to have_content 'Disable'
    expect(rendered).to have_content 'Featured | Home'
  end

  context 'when widget disabled' do
    let(:widget_status) { false }

    it 'render widget' do
      render

      expect(rendered).to have_content 'Enable'
      expect(rendered).to_not have_content 'Featured | Home'
    end
  end
end
