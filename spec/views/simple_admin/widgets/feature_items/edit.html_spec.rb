require 'spec_helper'

RSpec.describe 'simple_admin/widgets/feature_items/edit.html.erb', type: :view do
  let!(:post) { create :post, title: 'Hello world!' }

  let!(:widget_type) { create :widget_type, name: :featured }
  let!(:widget) { create :widget, widget_type_id: widget_type.id }

  let!(:feature_item) { create :widget_feature_item, object: post, widget_id: widget.id }

  let(:locale) { { locale: :en } }

  before do
    assign(:widget, widget)
    assign(:feature_items, SimpleAdmin::WidgetFeatureItem.where(widget_id: widget.id))
    allow(view).to receive(:current_locale).and_return(locale)
  end

  it 'render form' do
    render

    expect(rendered).to have_content post.title

    expect(rendered).to have_content 'Edit Featured Block'
    expect(rendered).to have_content 'Module name'
    expect(rendered).to have_content 'Module title'
    expect(rendered).to have_content 'Posts'
  end
end
