# frozen_string_literal: true

class Admin::DashboardController < Admin::ApplicationController
  def index; end

  def widget_response(table_name, name)
    @project_connector.send_request(:widget, { 'table_name' => table_name }, name).result
  end

  helper_method :widget_response
end
