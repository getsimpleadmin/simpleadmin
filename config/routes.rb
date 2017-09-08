Rails.application.routes.draw do
  scope module: :simple_admin do
    namespace :admin do
      root 'dashboard#index'

      resources :posts
      resources :categories

      if ActiveRecord::Base.connection.table_exists?('simple_admin_entities')
        SimpleAdmin::Entity.custom_enabled.each do |entity|
          collection_name = entity.model_klass.model_name.collection

          resources collection_name

          resource_controller = SimpleAdmin::ResourceController.new(collection_name)
          resource_controller.initialize_controller_klass!

          SimpleAdmin::ResourceControllerActions.initialize_actions!(resource_controller.controller_klass, entity.model_klass_name, collection_name)
        end
      end

      namespace :plugins do
        namespace :featured do
          get 'autocomplete' => 'feature_items#autocomplete'
        end
      end

      namespace :design do
        resources :layouts
        resources :layout_plugins, only: [:create, :update, :destroy]
      end

      namespace :system do
        resources :settings, only: [:index, :update]

        resources :plugin_types, only: [:index, :update] do
          resources :plugins
        end

        resources :users
        resources :profiles, only: [:edit, :update]

        resources :entities
        resources :entity_field_types
        resources :entity_fields, only: [:create, :update, :destroy]
      end
    end
  end
end
