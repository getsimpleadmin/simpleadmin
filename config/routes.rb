Rails.application.routes.draw do
  scope module: :simple_admin do
    namespace :admin do
      root 'system/users#index'

      get :search, to: 'search#index'

      if ActiveRecord::Base.connection.table_exists?(:simple_admin_entities)
        SimpleAdmin.mount_entities!(self)
      end

      namespace :system do
        SimpleAdmin.mount_system_routes!(self)

        resources :user_permissions, only: [:create, :update, :destroy]

        resources :entities
        resources :entity_field_types
        resources :entity_fields, only: [:create, :update, :destroy]
      end
    end
  end
end
