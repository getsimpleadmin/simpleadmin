require 'spec_helper'

RSpec.describe SimpleAdminHelper, type: :helper do
  describe '#resource_link' do
    let(:locale) { { locale: :ru } }
    let(:namespace) { :admin }

    before { allow_any_instance_of(SimpleAdminHelper).to receive(:current_locale).and_return(locale) }

    context 'when core resource' do
      context 'when post resource' do
        let(:resource_builded) { build :post }
        let(:resource_created) { create :post, category_id: 999 }

        it 'return resource paths' do
          expect(resource_link(resource_builded, :index,  nil, namespace)).to eq "/admin/posts?locale=ru"
          expect(resource_link(resource_builded, :new,    nil, namespace)).to eq "/admin/posts/new?locale=ru"
          expect(resource_link(resource_builded, :create, nil, namespace)).to eq "/admin/posts?locale=ru"

          expect(resource_link(resource_created, :edit,    nil, namespace)).to eq "/admin/posts/1/edit?locale=ru"
          expect(resource_link(resource_created, :update,  nil, namespace)).to eq "/admin/posts/1?locale=ru"
          expect(resource_link(resource_created, :destroy, nil, namespace)).to eq "/admin/posts/1?locale=ru"
        end
      end

      context 'when category resource' do
        let(:resource_builded) { build :category }
        let(:resource_created) { create :category }

        it 'return resource paths' do
          expect(resource_link(resource_builded, :index,  nil, namespace)).to eq "/admin/categories?locale=ru"
          expect(resource_link(resource_builded, :new,    nil, namespace)).to eq "/admin/categories/new?locale=ru"
          expect(resource_link(resource_builded, :create, nil, namespace)).to eq "/admin/categories?locale=ru"

          expect(resource_link(resource_created, :edit,    nil, namespace)).to eq "/admin/categories/1/edit?locale=ru"
          expect(resource_link(resource_created, :update,  nil, namespace)).to eq "/admin/categories/1?locale=ru"
          expect(resource_link(resource_created, :destroy, nil, namespace)).to eq "/admin/categories/1?locale=ru"
        end
      end
    end
  end
end
