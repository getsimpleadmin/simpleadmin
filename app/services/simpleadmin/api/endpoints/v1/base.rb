# frozen_string_literal: true

module Simpleadmin::API::Endpoints::V1
  class Base
    def initialize(table_name, project_url, encrypted_secret_key, params, url_attribute)
      @table_name = table_name

      @project_url = project_url
      @encrypted_secret_key = encrypted_secret_key

      @params = params
      @url_attribute = url_attribute
    end

    def call
      raise NotImplementedError, 'Please follow the unified interface, add method #call'
    end

    private

    attr_reader :table_name, :project_url, :encrypted_secret_key, :params, :url_attribute

    def send_request
      uri = URI.parse(endpoint_url)

      uri.query = params.to_param if params.present?

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = use_ssl?(uri.scheme)

      request = Net::HTTP::Get.new(uri.request_uri)
      request['SimpleAdmin-Secret-Key'] = encrypted_secret_key

      request_response = http.request(request)

      JSON.parse(request_response.body)
    end

    def endpoint_url
      url = "#{project_url}/#{self.class::ENDPOINT_URL}"
      url = "#{url}/#{url_attribute}" if url_attribute.present?

      url
    end

    def cached_request_response(expire_at: 1.day.to_i)
      if Redis.current.get(endpoint_url).nil?
        response = send_request

        Redis.current.set(endpoint_url, response.to_json)
        Redis.current.expire(endpoint_url, expire_at)
      else
        response = JSON.parse(Redis.current.get(endpoint_url))
      end

      response
    end

    def use_ssl?(uri_scheme)
      uri_scheme == 'https'
    end
  end
end
