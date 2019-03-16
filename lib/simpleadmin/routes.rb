module ActionDispatch::Routing
  class Mapper
    def mount_simpleadmin
      namespace :simple_admin do
        namespace :v1 do
          resources :entities, only: %i[index show]
          resources :resources
        end
      end
    end
  end
end
