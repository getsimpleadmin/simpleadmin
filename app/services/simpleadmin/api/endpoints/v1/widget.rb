# frozen_string_literal: true

module Simpleadmin::API::Endpoints::V1
  class Widget < Base
    ENDPOINT_URL = 'v1/widgets'

    def call
      OpenStruct.new(send_request)
    end
  end
end
