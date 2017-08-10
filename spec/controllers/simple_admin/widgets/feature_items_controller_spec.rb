require 'spec_helper'

RSpec.describe SimpleAdmin::Widgets::FeatureItemsController, type: :controller do
  describe '#autocomplete' do
    let!(:post_1) { create :post, title: 'Hello world' }
    let!(:post_2) { create :post, title: 'Some another' }

    let(:params) do
      {
        locale: :en,
        title: 'Hello'
      }
    end

    subject { get :autocomplete }

    specify do
      binding.pry
    end
  end
end
