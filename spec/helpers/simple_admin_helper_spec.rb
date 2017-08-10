require 'spec_helper'

RSpec.describe SimpleAdminHelper, type: :helper do
  describe '#resource_link' do
    let(:locale) { { locale: :ru } }
    let(:namespace) { :admin }

    before { allow_any_instance_of(SimpleAdminHelper).to receive(:current_locale).and_return(locale) }

    context 'when core resource' do
      context 'when post resource' do
        let(:resource_builded) { build :post }
        let(:resource_created) { create :post }

        it 'return resource paths' do
          expect(resource_link(resource_builded, :index,  nil, namespace)).to eq '/admin/posts?locale=ru'
          expect(resource_link(resource_builded, :new,    nil, namespace)).to eq '/admin/posts/new?locale=ru'
          expect(resource_link(resource_builded, :create, nil, namespace)).to eq '/admin/posts?locale=ru'

          expect(resource_link(resource_created, :edit,    nil, namespace)).to eq '/admin/posts/1/edit?locale=ru'
          expect(resource_link(resource_created, :update,  nil, namespace)).to eq '/admin/posts/1?locale=ru'
          expect(resource_link(resource_created, :destroy, nil, namespace)).to eq '/admin/posts/1?locale=ru'
        end
      end

      context 'when category resource' do
        let(:resource_builded) { build :category }
        let(:resource_created) { create :category }

        it 'return resource paths' do
          expect(resource_link(resource_builded, :index,  nil, namespace)).to eq '/admin/categories?locale=ru'
          expect(resource_link(resource_builded, :new,    nil, namespace)).to eq '/admin/categories/new?locale=ru'
          expect(resource_link(resource_builded, :create, nil, namespace)).to eq '/admin/categories?locale=ru'

          expect(resource_link(resource_created, :edit,    nil, namespace)).to eq '/admin/categories/1/edit?locale=ru'
          expect(resource_link(resource_created, :update,  nil, namespace)).to eq '/admin/categories/1?locale=ru'
          expect(resource_link(resource_created, :destroy, nil, namespace)).to eq '/admin/categories/1?locale=ru'
        end
      end
    end
  end

  describe '#resource_collection_title' do
    let(:entity) { create :entity }

    subject { resource_collection_title(entity) }

    it { expect(subject).to eq "simple_admin.admin.posts.index.title" }
  end

  describe '#resource_collection_link' do
    let(:entity) { create :entity }
    let(:locale) { { locale: :en } }

    subject { resource_collection_link(entity, locale) }

    it { expect(subject).to eq admin_posts_path(locale) }
  end

  describe '#resource_active_link' do
    let(:resource_link) { admin_posts_path(locale) }
    let(:locale) { { locale: :en } }

    before { allow_any_instance_of(SimpleAdminHelper).to receive(:url_for).and_return(admin_posts_path(locale)) }

    subject { resource_active_link(resource_link) }

    it { expect(subject).to eq 'nav-group__open' }

    context 'when not active' do
      let(:resource_link) { admin_widgets_path(locale) }

      it { expect(subject).to eq '' }
    end
  end
end
