module Admin
  class EntitiesController < BaseController
    include SimpleAdmin::InbuiltControllerSettings
    include SimpleAdmin::CrudControllerHelper

    before_action only: [:new, :edit] do
      Rails.application.eager_load!
    end

    def model_klass
      SimpleAdmin::Entity
    end

    def redirect_path
      admin_entities_path
    end

    private

    def resource_params
      params.require(:name)
    end
  end
end
