Rails.application.routes.draw do
  scope module: 'simple_admin' do
    namespace :admin do
      root 'dashboard#index'

      scope "/:locale", locale: 'en|ru' do
        get 'dashboard' => 'dashboard#index'

        namespace :system do
          resources :settings, only: :index
          put 'update_settings', to: 'settings#update_settings', as: :update_settings

          resources :languages, except: :show
          resources :entities,  except: :show
          resources :entity_field_types, except: :show
        end

        resources :entity_fields, only: [:create, :update, :destroy]

        if ActiveRecord::Base.connection.table_exists?('simple_admin_entities')
          SimpleAdmin::Entity.collection_names.each do |model_name, collection_name|
            resources collection_name, except: :show

            resource_controller = SimpleAdmin::ResourceController.new(collection_name)
            resource_controller.initialize_controller_klass!

            SimpleAdmin::ResourceActions.initialize_controller_actions!(resource_controller.controller_klass_name, model_name, collection_name)
          end
        end

      end
    end
  end
end
