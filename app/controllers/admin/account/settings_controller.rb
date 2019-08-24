# frozen_string_literal: true

class Admin::Account::SettingsController < Admin::ApplicationController
  authorize_resource class: Project

  def index; end

  def update
    if @project.update(project_params)
      redirect_to admin_account_settings_path, notice: controller_notice(action_name)
    else
      render :index
    end
  end

  private

  def controller_notice(action_name)
    t("simple_admin.resource.#{action_name}.success", resource_name: :Project)
  end

  def project_params
    params.require(:project).permit(:name, :page_title, :favicon, :style)
  end
end
