Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :simple_admin do
        resources :entities,  only: [:index, :show]
        resources :resources

        post 'verify_key' => 'credentials#verify_key'
      end
    end
  end
end
