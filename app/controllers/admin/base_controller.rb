module Admin
  class BaseController < ActionController::Base
    layout 'simple_admin'

    include SimpleAdmin::EntityControllerSetter
  end
end
