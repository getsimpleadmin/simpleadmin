Rails.application.routes.draw do
  namespace :admin do
    namespace :system do
      resources :settings, only: [:index, :update]
      resources :languages, except: :show
      resources :entities,  except: :show
      resources :entity_field_types, except: :show
    end

    resources :posts
  end
end
