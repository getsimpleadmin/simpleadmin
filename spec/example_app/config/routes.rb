Rails.application.routes.draw do
  scope module: :simple_admin do
    namespace :admin do
      resources :posts
    end
  end
end
