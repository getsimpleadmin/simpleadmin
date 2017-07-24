require 'simple_admin/dynamic_actions'
require 'simple_admin/dynamic_controllers'

Rails.application.routes.draw do
  namespace :admin do
    root 'dashboard#index'

    scope "/:locale", locale: 'en|ru' do #locale: SimpleAdmin::Language.language_codes do
      get 'dashboard' => 'dashboard#index'

      namespace :system do
        resources :settings, only: [:index, :update]
        resources :languages, except: :show
        resources :entities,  except: :show
        resources :entity_field_types, except: :show
      end

      resources :entity_fields, only: [:create, :update, :destroy]

      # %w(posts categories).each do |collection_name|
      #   resources collection_name
      #
      #   dynamic_controller = SimpleAdmin::DynamicControllers.new(collection_name)
      #   dynamic_controller.set!
      #
      #   SimpleAdmin::DynamicActions.set!(dynamic_controller.get_klass_name, collection_name)
      # end
    end
  end
end
