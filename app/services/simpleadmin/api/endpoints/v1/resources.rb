# frozen_string_literal: true

module Simpleadmin::API::Endpoints::V1
  class Resources < Base
    ENDPOINT_URL = 'v1/resources'

    def call
      OpenStruct.new(send_request)
    end
  end
end
