# frozen_string_literal: true

module Admin::Resources
  class ImportController < Admin::ApplicationController
    def create
      @entity = @project.entities.find_by!(model_klass_name: params[:resource_id])

      Simpleadmin::Resources::ImportService.new(@project_connector, params[:resource_id], params[:file]).import

      redirect_to admin_resources_path(resource_id: params[:resource_id]), notice: 'File successfully imported'
    end
  end
end
