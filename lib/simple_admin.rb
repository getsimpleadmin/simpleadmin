require 'simple_admin/version'

module SimpleAdmin
  autoload :ResourceActions, 'simple_admin/resource_actions'
  autoload :ResourceController, 'simple_admin/resource_controller'

  autoload :ApplicationRecordExt, 'simple_admin/extensions/application_record_ext'
  autoload :TrueExt, 'simple_admin/extensions/boolean/true_ext'
  autoload :FalseExt, 'simple_admin/extensions/boolean/false_ext'

  class << self
    def setup!
      ApplicationRecord.class_eval { include SimpleAdmin::ApplicationRecordExt }

      TrueClass.class_eval  { include SimpleAdmin::TrueExt }
      FalseClass.class_eval { include SimpleAdmin::FalseExt }
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
