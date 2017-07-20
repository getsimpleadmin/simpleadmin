Rails.application.routes.draw do
  namespace :admin do
    resources :entities
  end
end
