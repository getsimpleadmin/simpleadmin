# frozen_string_literal: true

module Simpleadmin::API::Endpoints::V1
  class Resource < Base
    ENDPOINT_URL = 'v1/resources'

    def call
      send_request
    end
  end
end
