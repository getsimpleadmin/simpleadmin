require 'simple_admin/version'
require 'simple_admin/engine'

module SimpleAdmin
  module Refinements
    autoload :Boolean, 'simple_admin/refinements/boolean'
  end

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
    end
  end
end
