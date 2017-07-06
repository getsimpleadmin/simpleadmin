Rails.application.routes.draw do
  namespace :admin do
    root 'dashboard#index'
    
    get 'dashboard' => 'dashboard#index'

    resources :posts
  end
end
