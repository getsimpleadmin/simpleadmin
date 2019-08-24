# frozen_string_literal: true

module Simpleadmin::Registration::Steps
  class Model < Base
    def template_resource
      project_connector = Simpleadmin::APIConnector.new(current_user.project.url,
                                                        current_user.project.encrypted_secret_key,
                                                        resource_id)

      project_connector.send_request(:tables)
    end

    def previous_step_path
      admin_setup_step_path(:project)
    end

    def step_done?
      current_user.project.entities.any?
    end

    def previous_step_done?
      Simpleadmin::Registration::Steps::Project.new(current_user: current_user,
                                                    resource_id: resource_id).step_done?
    end

    def controller_redirect_notice
      Simpleadmin::Registration::Steps::Project.new(current_user: current_user,
                                                    resource_id: resource_id).controller_redirect_notice
    end

    def resource; end

    def next_step_path
      admin_system_models_path(current_user.project)
    end

    def permitted_params; end

    def required_param; end
  end
end
