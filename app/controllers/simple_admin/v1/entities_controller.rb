module SimpleAdmin
  module V1
    class EntitiesController < BaseController
      before_action :load_models!

      def index
        render json: { models: SimpleAdmin::Abstractions::Model.list }
      end

      def show
        render json: SimpleAdmin::Abstractions::Model.attributes_by_model_klass(params[:id])
      end

      private

        def load_models!
          Rails.application.load_models!
        end
    end
  end
end
