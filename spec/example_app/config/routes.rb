Rails.application.routes.draw do
  devise_for :users, class_name: 'SimpleAdmin::User', controllers: { sessions: 'simple_admin/sessions' }

  scope module: :simple_admin do
    namespace :admin do
      resources :posts
    end
  end
end
