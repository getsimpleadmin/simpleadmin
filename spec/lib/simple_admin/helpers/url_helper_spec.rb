require 'spec_helper'
require 'simple_admin/helpers/url_helper'

RSpec.describe SimpleAdmin::Helpers::UrlHelper do
  include Rails.application.routes.url_helpers
  include SimpleAdmin::Helpers::UrlHelper

  let(:user) { create :user }

  describe '#resource_link' do
    let(:resource_builded) { build :post,  user: user }
    let(:resource_created) { create :post, user: user }

    it 'return resource paths' do
      expect(resource_link(resource_builded, :new)).to eq '/admin/posts/new'
      expect(resource_link(resource_builded, :create)).to eq '/admin/posts'

      expect(resource_link(resource_created, :edit)).to eq "/admin/posts/#{resource_created.to_param}/edit"
      expect(resource_link(resource_created, :update)).to eq "/admin/posts/#{resource_created.to_param}"
      expect(resource_link(resource_created, :destroy)).to eq "/admin/posts/#{resource_created.to_param}"
    end
  end
end
