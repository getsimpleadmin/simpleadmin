require 'spec_helper'
require 'simple_admin/helpers/url_helper'

RSpec.describe SimpleAdmin::Helpers::UrlHelper do
  include Rails.application.routes.url_helpers
  include SimpleAdmin::Helpers::UrlHelper

  describe '#resource_link' do
    context 'when core resource' do
      context 'when post resource' do
        let(:resource_builded) { build :post }
        let(:resource_created) { create :post }

        it 'return resource paths' do
          expect(resource_link(resource_builded, :new)).to eq '/admin/posts/new'
          expect(resource_link(resource_builded, :create)).to eq '/admin/posts'

          expect(resource_link(resource_created, :edit)).to eq "/admin/posts/#{resource_created.to_param}/edit"
          expect(resource_link(resource_created, :update)).to eq "/admin/posts/#{resource_created.to_param}"
          expect(resource_link(resource_created, :destroy)).to eq "/admin/posts/#{resource_created.to_param}"
        end
      end

      context 'when category resource' do
        let(:resource_builded) { build :category }
        let(:resource_created) { create :category }

        it 'return resource paths' do
          expect(resource_link(resource_builded, :new)).to eq '/admin/categories/new'
          expect(resource_link(resource_builded, :create)).to eq '/admin/categories'

          expect(resource_link(resource_created, :edit)).to eq "/admin/categories/#{resource_created.to_param}/edit"
          expect(resource_link(resource_created, :update)).to eq "/admin/categories/#{resource_created.to_param}"
          expect(resource_link(resource_created, :destroy)).to eq "/admin/categories/#{resource_created.to_param}"
        end
      end
    end
  end
end
