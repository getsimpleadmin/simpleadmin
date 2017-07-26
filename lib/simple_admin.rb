require 'simple_admin/version'

module SimpleAdmin
  autoload :ResourceActions, 'simple_admin/resource_actions'
  autoload :ResourceController, 'simple_admin/resource_controller'

  autoload :EntityControllerSetter, 'simple_admin/support/entity_controller_setter'
  autoload :ResourceFieldsControllerSetter, 'simple_admin/support/resource_fields_controller_setter'
  autoload :InbuiltControllerSettings, 'simple_admin/support/inbuilt_controller_settings'
  autoload :CrudControllerHelper, 'simple_admin/support/crud_controller_helper'

  autoload :Overrides, 'simple_admin/core_ext/overrides'

  class << self
    def core_controllers
      [
        Admin::System::EntitiesController,
        Admin::System::EntityFieldTypesController,
        Admin::System::LanguagesController,
        Admin::System::SettingsController,
        Admin::EntityFieldsController,
        Admin::DashboardController
      ]
    end

    def core_models
      {
        SimpleAdmin::Post => :posts,
        SimpleAdmin::Category => :categories
      }
    end
  end
end

require 'simple_admin/engine'
