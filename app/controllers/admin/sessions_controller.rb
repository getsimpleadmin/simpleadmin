# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)

    yield resource if block_given?

    render 'admin/sessions/new'
  end

  protected

  def after_sign_in_path_for(_resource)
    admin_dashboard_index_path(current_admin_user.project)
  end
end
