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
  autoload :RoutesMounter, 'simple_admin/routes_mounter'
  autoload :Config, 'simple_admin/config'

  class << self
    def setup!
      ApplicationRecord.class_eval { include SimpleAdmin::ApplicationRecordExt }

      TrueClass.class_eval  { include SimpleAdmin::TrueExt }
      FalseClass.class_eval { include SimpleAdmin::FalseExt }
    end

    def core_controllers
      [
        Admin::System::EntitiesController,
        Admin::System::EntityFieldTypesController,
        Admin::System::LanguagesController,
        Admin::System::SettingsController,
        Admin::EntityFieldsController,
        # Admin::GuidesController,
        Admin::DashboardController
      ]
    end

    def core_models
      {
        SimpleAdmin::Post => :posts,
        SimpleAdmin::Category => :categories
      }
    def setup_controller!(resource_name, model_klass_name)
      controller_builder = SimpleAdmin::ResourceController::ControllerBuilder.new(resource_name)
      controller_builder.build!
    end

    autoload :Search, 'simple_admin/search'

  class << self
    def mount_entities!(routing_mapper)
      SimpleAdmin::Entity.resource_attributes.each do |resource_name, model_klass_name|
        routing_mapper.resources(resource_name)

        controller_builder = SimpleAdmin::ResourceController::ControllerBuilder.new(resource_name)
        controller_builder.build!

        SimpleAdmin::ResourceController::ActionsBuilder.initialize_actions!(controller_builder.controller_klass, model_klass_name)
      end
    end

    def mount_system_routes!(routing_mapper)
      SimpleAdmin::RoutesMounter.mount_system_routes!(routing_mapper)
    end
  end
end
