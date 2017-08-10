require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::WidgetTypesController, type: :controller do
  describe '#update' do
    let(:widget_type) { create :widget_type }

    let(:params) do
      {
        id: widget_type.to_param
      }
    end

    before do
      allow(controller).to receive(:authenticate_user!).and_return(true)
    end

    subject { put :update, params: params }

    it 'update widget type' do
      expect(subject).to redirect_to admin_widgets_path(current_locale)
      expect(widget_type.reload.status).to eq true
    end
  end
end
