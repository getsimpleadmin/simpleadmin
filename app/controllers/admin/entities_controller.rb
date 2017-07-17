module Admin
  class EntitiesController < BaseController
    def index
      @entities = SimpleAdmin::Entity.all
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
