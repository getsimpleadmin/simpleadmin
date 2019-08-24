# frozen_string_literal: true

module Simpleadmin::API::Endpoints::V1
  class Table < Base
    ENDPOINT_URL = 'v1/tables'

    def call
      cached_request_response.map do |resource|
        [
          "#{resource['column_name']} (#{resource['data_type']})",
          resource['column_name']
        ]
      end
    end
  end
end
