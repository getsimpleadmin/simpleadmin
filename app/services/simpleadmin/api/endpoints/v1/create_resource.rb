# frozen_string_literal: true

module Simpleadmin::API::Endpoints::V1
  class CreateResource < Base
    ENDPOINT_URL = 'v1/resources'

    def call
      uri = URI.parse(endpoint_url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = use_ssl?(uri.scheme)

      request = Net::HTTP::Post.new(uri.request_uri)
      request['SimpleAdmin-Secret-Key'] = encrypted_secret_key

      request.body = {
        'table_name' => table_name,
        'resource' => params
      }.to_query

      http.request(request)
    end
  end
end
