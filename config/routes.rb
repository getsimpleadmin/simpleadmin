Rails.application.routes.draw do
  scope module: :simple_admin do
    namespace :admin do
      root 'dashboard#index'

      resources :posts
      resources :categories

      namespace :system do
        resources :settings, only: [:index, :update]

        resources :plugin_types, only: [:index, :update] do
          resources :plugins
        end

        resources :users
        resources :profiles, only: [:edit, :update]

        resources :entities
        resources :entity_field_types
        resources :entity_fields, only: [:create, :update, :destroy]
      end
    end
  end
end
