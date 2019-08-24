# frozen_string_literal: true

class Admin::Setup::BaseController < Admin::ApplicationController
  TEMPLATE_PATH = 'admin/setup'

  layout 'admin/account_setup'

  skip_before_action :load_project, :load_service

  before_action :handle_missing_step!

  before_action :step_already_done!, if: :step_already_done?
  before_action :step_not_done!

  private

  def handle_missing_step!
    raise ActiveRecord::RecordNotFound if current_step_class.blank?
  end

  def step_already_done!
    redirect_to current_step.next_step_path, notice: 'Steps already done'
  end

  def step_already_done?
    current_step.step_done?
  end

  def step_not_done!
    unless current_step.previous_step_done?
      redirect_to current_step.previous_step_path,
                  notice: current_step.controller_redirect_notice
    end
  end

  def template_path
    "#{TEMPLATE_PATH}/#{params[:id]}"
  end

  def current_step_class
    Simpleadmin::Registration::Steps::Base::STEPS[params[:id]]
  end

  def current_step
    @current_step ||= current_step_class.new(current_user: current_user, resource_id: params[:resource_id])
  end
end
