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

    def mount_simpleadmin
      namespace :simple_admin do
        resources :entities,  only: [:index, :show]
        resources :entity_field_type_actions, only: :create

        resources :resources

        get 'version', to: 'versions#show'
      end
    end
  end
end
