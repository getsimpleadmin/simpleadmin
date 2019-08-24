# frozen_string_literal: true

class Simpleadmin::APIConnector
  ENDPOINTS_NAMESPACE = Simpleadmin::API::Endpoints::V1

  def initialize(project_url, encrypted_secret_key, table_name)
    @project_url = project_url
    @encrypted_secret_key = encrypted_secret_key

    @table_name = table_name
  end

  def send_request(endpoint_alias, options = {}, url_attribute = nil)
    endpoint = endpoint_class_by_alias_name(endpoint_alias).new(table_name, project_url,
                                                                encrypted_secret_key, options, url_attribute)
    endpoint.call
  end

  private

  attr_reader :project_url, :encrypted_secret_key, :table_name

  def endpoint_class_by_alias_name(alias_name)
    endpoint_class = "#{ENDPOINTS_NAMESPACE}::#{alias_name.to_s.camelize}".safe_constantize

    if endpoint_class.nil?
      raise ArgumentError, 'Wrong endpoint name' if endpoint_class.nil?
    else
      endpoint_class
    end
  end
end
