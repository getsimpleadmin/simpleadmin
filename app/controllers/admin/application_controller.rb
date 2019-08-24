# frozen_string_literal: true

class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  layout 'admin'

  before_action do
    if current_admin_user.present?
      authenticate_admin_user!
    else
      authenticate_user!
    end
  end

  before_action :load_project, :load_service

  rescue_from SecurityError do |exception|
    redirect_to admin_system_models_path(current_user.current_project), notice: exception
  end

  private

  def current_ability
    Ability.new(current_admin_user || current_user, params[:resource_id], @project.slug)
  end

  def load_project
    if current_user.present?
      @project = current_user.project
    elsif current_admin_user.present?
      @project = current_admin_user.project
    else
      redirect_to root_path, flash: { error: t('projects.not_found') }
    end
  end

  def load_service
    @project_connector = Simpleadmin::APIConnector.new(@project.url,
                                                       @project.encrypted_secret_key,
                                                       params[:resource_id])
  end
end
