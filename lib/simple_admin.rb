require 'simple_admin/version'
require 'simple_admin/engine'

module SimpleAdmin
  module Refinements
    require 'simple_admin/refinements/boolean'
  end

  module ResourceController
    require 'simple_admin/resource_controller/actions_builder'
    require 'simple_admin/resource_controller/controller_builder'

    require 'simple_admin/resource_controller/crudify'
    require 'simple_admin/resource_controller/crudify_dynamic_resource'

    require 'simple_admin/resource_controller/dynamic_fields'
  end

  module Helpers
    require 'simple_admin/helpers/url_helper'
    require 'simple_admin/helpers/boolean_helper'
  end

  require 'simple_admin/config'
  require 'simple_admin/search'

  class << self
    def mount_entities!(routing_mapper)
      SimpleAdmin::Entity.resource_attributes.each do |resource_name, model_klass_name|
        routing_mapper.resources(resource_name)

        controller_builder = SimpleAdmin::ResourceController::ControllerBuilder.new(resource_name)
        controller_builder.build!

        SimpleAdmin::ResourceController::ActionsBuilder.initialize_actions!(controller_builder.controller_klass, model_klass_name)
      end
    end
  end
end
