# frozen_string_literal: true

class Admin::Setup::ModelsController < Admin::ApplicationController
  skip_before_action :load_project, :load_service

  def update
    @project_connector = Simpleadmin::APIConnector.new(current_user.project.url,
                                                       current_user.project.encrypted_secret_key,
                                                       params[:resource_id])

    @project_entities = @project_connector.send_request(:tables)

    if params[:model_values].present?
      Simpleadmin::DBStructureImport.new(current_user.project, params[:model_values], @project_entities).call
    end

    redirect_to admin_system_models_path(current_user.project)
  end
end
