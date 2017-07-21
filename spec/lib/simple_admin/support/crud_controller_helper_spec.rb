require 'spec_helper'
require 'simple_admin/support/crud_controller_helper'

class Admin::PostsController < ActionController::Base; end

RSpec.describe Admin::PostsController, type: :controller do
  controller do
    include SimpleAdmin::CrudControllerHelper

    def model_klass
      SimpleAdmin::Post
    end

    def redirect_path
      admin_posts_path
    end

    private

    def resource_params
      params.require(:simple_admin_post).permit(:name)
    end
  end
end
