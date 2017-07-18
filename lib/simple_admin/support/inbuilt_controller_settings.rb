require 'yaml'

module SimpleAdmin
  module InbuiltControllerSettings
    extend ActiveSupport::Concern

    included do
      before_action :setup_admin_settings!

      private

      def setup_admin_settings!
        settings = YAML::load_file(File.join(Dir.pwd, setting_file_path))
        @resource_settings = SimpleAdmin::Setting.new(settings[controller_entity_name])
      end

      def setting_file_path
        'config/simple_admin_settings.yml'
      end
    end
  end
end
