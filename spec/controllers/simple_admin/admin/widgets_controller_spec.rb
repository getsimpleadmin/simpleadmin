require 'spec_helper'

RSpec.describe SimpleAdmin::Admin::WidgetsController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(200) }
  end

  describe '#create' do
    let(:widget_type) { create :widget_type, name: widget_type_name }
    let(:widget_type_name) { :example }

    let(:params) do
      {
        simple_admin_widget: {
          name: :example_home,
          label: 'Example Home',
          widget_type_id: widget_type.id
        },
        post_ids: [1, 2]
      }
    end

    subject { post :create, params: params }

    it { expect { subject }.to raise_error NotImplementedError }

    context 'when widget not implemented callbacks' do
      let(:widget_type_name) { :featured }

      it 'create feature items' do
        expect { subject }.to change { SimpleAdmin::WidgetFeatureItem.count }.by(2)
        expect(flash[:notice]).to eq I18n.t('simple_admin.admin.widgets.create.success')
      end
    end
  end

  describe '#update' do
    let(:widget) { create :widget }
    let(:widget_type) { create :widget_type, name: :featured }

    let(:params) do
      {
        id: widget.to_param,
        simple_admin_widget: {
          name: :example_home,
          label: 'Example Home',
          widget_type_id: widget_type.id
        },
        post_ids: [1, 2]
      }
    end

    subject { patch :update, params: params }

    it 'update widget' do
      subject

      expect(widget.reload.name).to eq 'example_home'
      expect(widget.label).to eq 'Example Home'

      expect(flash[:notice]).to eq I18n.t('simple_admin.admin.widgets.update.success')
    end
  end

  describe '#destroy' do
    let(:widget) { create :widget }

    let(:params) do
      {
        id: widget.to_param
      }
    end

    subject { delete :destroy, params: params }

    it 'delete widget' do
      subject

      expect(SimpleAdmin::Widget.count).to eq 0
      expect(subject).to redirect_to admin_widgets_path(current_locale)

      expect(flash[:notice]).to eq I18n.t('simple_admin.admin.widgets.destroy.success')
    end
  end
end
