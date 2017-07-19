module Admin
  class EntitiesController < BaseController
    include SimpleAdmin::InbuiltControllerSettings

    before_action only: [:new, :edit] do
      Rails.application.eager_load!
    end

    def index
      @entities = SimpleAdmin::Entity.all
    end

    def new
      @entity = SimpleAdmin::Entity.new
    end

    def edit
      @entity = SimpleAdmin::Entity.find(params[:id])
    end

    def update
      @entity = SimpleAdmin::Entity.find(params[:id])

      if @entity.update(entity_params)
        redirect_to admin_entities_path
      else
        render :edit
      end
    end

    private

    def entity_params
      params.require(:name)
    end
  end
end
