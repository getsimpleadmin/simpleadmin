Rails.application.routes.draw do
  scope module: :simple_admin do
    namespace :admin do
      root 'system/users#index'

      get :search, to: 'search#index'

      # TODO: Entities routes

      namespace :system do
        # TODO: System routes

        resources :user_permissions, only: [:create, :update, :destroy]
        resources :profiles, only: [:edit, :update]

        resources :entities
        resources :entity_field_types
        resources :entity_fields, only: [:create, :update, :destroy]
      end
    end
  end
end
