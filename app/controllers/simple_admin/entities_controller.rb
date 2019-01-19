module SimpleAdmin
  class EntitiesController < BaseController
    before_action :load_models!
    before_action :entity_service

    def index
      render json: @entity_service.index_action
    end

    def show
      resource_klass = params[:id].constantize

      render json: @entity_service.show_action(resource_klass)
    end

    private

      def entity_service
        @entity_service = EntityService.new
      end

      def load_models!
        Rails.application.eager_load!
      end
  end
end
