module SimpleAdmin
  module V1
    module Widgets
      class ResourceQuantityController < SimpleAdmin::V1::BaseController
        def show
          render json: SimpleAdmin::Abstractions::Model.find_by_name(params[:model_klass_name]).count
        end
      end
    end
  end
end
