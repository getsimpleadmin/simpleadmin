Rails.application.routes.draw do
  namespace :admin do
    resources :entities,  except: :show
    resources :languages, except: :show
    resources :entity_field_types, except: :show

    resources :settings, only: [:index, :update]
  end
end
