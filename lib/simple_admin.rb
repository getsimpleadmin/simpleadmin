require 'simple_admin/version'
require 'simple_admin/engine'

module SimpleAdmin
  PER_PAGE = 10

  module Refinements
    autoload :Boolean, 'simple_admin/refinements/boolean'
  end

  module ResourceController
    autoload :ActionsBuilder, 'simple_admin/resource_controller/actions_builder'
    autoload :ControllerBuilder, 'simple_admin/resource_controller/controller_builder'

    autoload :Crudify, 'simple_admin/resource_controller/crudify'
    autoload :CrudifyDynamicResource, 'simple_admin/resource_controller/crudify_dynamic_resource'

    autoload :DynamicFields, 'simple_admin/resource_controller/dynamic_fields'
  end

  module Helpers
    autoload :UrlHelper, 'simple_admin/helpers/url_helper'
    autoload :BooleanHelper, 'simple_admin/helpers/boolean_helper'
  end

  module Menu
    autoload :Item, 'simple_admin/menu/item'
    autoload :Route, 'simple_admin/menu/route'
  end

  autoload :MenuDsl, 'simple_admin/menu_dsl'
  autoload :Config, 'simple_admin/config'

  autoload :Search, 'simple_admin/search'

  class << self

  end
end
