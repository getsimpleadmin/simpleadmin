require 'spec_helper'
require 'simple_admin/support/entity_controller_setter'

class Admin::ExamplesController < ActionController::Base; end

RSpec.describe Admin::ExamplesController, type: :controller do
  controller do
    include SimpleAdmin::EntityControllerSetter

    def index
      respond_to do |format|
        format.html { render layout: false }
      end
    end
  end

  subject { get :index }

  it 'render view' do
    subject

    expect(assigns(:controller_entity_name)).to eq 'examples'
  end
end
