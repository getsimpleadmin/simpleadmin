# frozen_string_literal: true

module Simpleadmin::API::Endpoints::V1
  class DestroyResource < Base
    ENDPOINT_URL = 'v1/resources'

    def call
      uri = URI.parse(endpoint_url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = use_ssl?(uri.scheme)

      request = Net::HTTP::Delete.new(uri.request_uri)
      request['SimpleAdmin-Secret-Key'] = encrypted_secret_key

      request.body = {
        'id' => url_attribute,
        'table_name' => table_name
      }.to_query

      response = http.request(request)
      response.message
    end
  end
end
