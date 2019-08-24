# frozen_string_literal: true

class Admin::Setup::StepsController < Admin::Setup::BaseController
  def show
    @resource = current_step.template_resource if current_step.respond_to?(:template_resource)

    render template_path
  end

  def update
    resource = current_step.resource

    if resource.update(step_params)
      redirect_to current_step.next_step_path
    else
      render template_path
    end
  end

  private

  def step_params
    params.require(current_step.required_param).permit(*current_step.permitted_params)
  end
end
