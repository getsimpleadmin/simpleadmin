require 'yaml'

module Admin
  class EntityFieldTypesController < BaseController
    SETTING_FILE_PATH = 'config/simple_admin_settings.yml'

    before_action :setup_admin_settings!

    def index
      @entity_field_types = SimpleAdmin::EntityFieldType.all
    end

    def new
      @entity_field_type = SimpleAdmin::EntityFieldType.new
    end

    def create
      @entity_field_type = SimpleAdmin::EntityFieldType.new(entity_field_type_params)

      if @entity_field_type.save
        redirect_to admin_entity_field_types_path
      else
        render :new
      end
    end

    def destroy
      @entity_field_type = SimpleAdmin::EntityFieldType.find(params[:id])
      @entity_field_type.destroy

      redirect_to admin_entity_field_types_path
    end

    private

    def setup_admin_settings!
      settings = YAML::load_file(File.join(__dir__, SETTING_FILE_PATH))
      @resource_settings = SimpleAdmin::Setting.new(settings[controller_entity_name])
    end
  end
end
