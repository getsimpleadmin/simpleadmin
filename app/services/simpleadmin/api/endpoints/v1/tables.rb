# frozen_string_literal: true

module Simpleadmin::API::Endpoints::V1
  class Tables < Base
    ENDPOINT_URL = 'v1/tables'

    def call
      request_response = cached_request_response

      response = OpenStruct.new

      response.model_names = request_response.map { |resource| resource['table_name'] }

      model_columns = {}

      response.model_names.each do |model_name|
        model_columns[model_name] = request_response.find do |resource|
          resource['table_name'] == model_name
        end['table_columns']
      end

      response.model_columns = model_columns

      response
    end
  end
end
