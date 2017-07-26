shared_examples :crud_view_collection do
  let(:current_locale) { { locale: :ru } }

  before { allow(view).to receive(:current_locale).and_return(current_locale) }
  before { assign(:resources, resources) }

  it 'render resource' do
    render

    expect(rendered).to have_content resource_title

    resource_attributes.each do |resource_attribute|
      expect(rendered).to have_content resources.first.public_send(resource_attribute)
    end
  end

  context 'when resources empty' do
    before { assign(:resources, []) }

    it 'render not found' do
      render

      expect(rendered).to have_content 'Not found'
    end
  end
end

shared_examples :crud_view_form do
  let(:current_locale) { { locale: :ru } }

  before { allow(view).to receive(:current_locale).and_return(current_locale) }
  before { assign(:resource, resource) }

  it 'render resource' do
    render
    expect(rendered).to have_content resource_title
  end
end
