require 'spec_helper'

RSpec.describe 'simple_admin/admin/resource/edit.html.erb', type: :view do
  let(:user) { create :user }

  let(:entity) { create :entity }
  let(:resource) { create :post, user: user }

  before do
    assign(:entity, entity)
    assign(:resource, resource)

    assign(:entity_fields, entity.entity_fields)

    allow(view).to receive(:resource).and_return(resource)
  end

  it { render }
end
