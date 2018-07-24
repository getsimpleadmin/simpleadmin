module ActionDispatch::Routing
  class Mapper
    # Contain built-in routes
    #
    # @example
    #
    #   # config/routes.rb
    #
    #   Rails.application.routes.draw do
    #     mount_for_simple_admin
    #   end
    #
    # @since 1.0.0

    def mount_for_simple_admin
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
  end
end
