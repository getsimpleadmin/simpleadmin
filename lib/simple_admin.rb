require 'simple_admin/version'
require 'simple_admin/engine'

module SimpleAdmin
  module Refinements
    autoload :Boolean, 'simple_admin/refinements/boolean'
  end

  autoload :ResourceController, 'simple_admin/resource_controller'
  autoload :ResourceControllerActions, 'simple_admin/resource_controller_actions'

  autoload :ResourceUrlHelper, 'simple_admin/resource_url_helper'

  class << self
  end
end
