module ActionDispatch::Routing
  class Mapper
    def mount_simpleadmin
      namespace :simple_admin do
        resources :entities, only: %i[index show]
        resources :entity_field_type_actions, only: :create

        resources :resources do
          get :show_by,    on: :collection
          get :show_total, on: :collection
        end

        get 'version', to: 'versions#show'
      end
    end
  end
end
