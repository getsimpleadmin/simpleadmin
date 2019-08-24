# frozen_string_literal: true

class Admin::System::ModelsController < Admin::ApplicationController
  authorize_resource class: SimpleAdmin::Entity

  include SimpleCrudify::Crudify

  actions :crud

  def new
    @resource = model_klass.new
    @project_entities = @project_connector.send_request(:tables)

    render template_path
  end

  def create
    @resource = model_klass.new(resource_params)
    @project_entities = @project_connector.send_request(:tables)

    if @resource.save
      redirect_to after_create_path, notice: controller_notice(action_name)
    else
      render template: template_path(:new)
    end
  end

  def edit
    @resource = model_klass.friendly.find_by_friendly_id(params[:id])
    @project_entity_fields = @project_connector.send_request(:table, {}, @resource.model_klass_name)
    @project_entities      = @project_connector.send_request(:tables)

    render template_path
  end

  def model_klass
    @project.entities
  end

  private

  def after_create_path
    edit_admin_system_model_path(@project, @resource)
  end

  def after_update_path
    admin_system_models_path
  end

  def after_destroy_path
    admin_system_models_path
  end

  def controller_notice(action_name)
    t("simple_admin.resource.#{action_name}.success", resource_name: :Model)
  end

  def resource_params
    params.require(:simple_admin_entity).permit(:model_klass_name, :label, :icon, :status, :page_layout_id)
  end
end
