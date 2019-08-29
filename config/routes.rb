# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: ''

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  namespace :admin do
    namespace :setup do
      resources :steps,  only: %i[show update]
      resources :models, only: :update
    end
  end

  scope '/:project_id/admin', module: :admin, as: :admin do
    root 'admin/system/entities#index'

    devise_for :users, path: '', class_name: 'SimpleAdmin::User', controllers: {
      sessions: 'admin/sessions'
    }

    namespace :account do
      resources :settings, only: %i[index update]

      namespace :settings do
        resources :clear_redis_cache, only: :create
      end
    end

    scope '/:resource_id' do
      resources :resources

      namespace :resources do
        resources :export, only: :index
        resources :import, only: :create

        resources :batch_destroy, only: :destroy
      end
    end

    resources :dashboard, only: :index

    namespace :system do
      resources :models,  except: :show
      resources :widgets, except: :show

      resources :user_roles, except: :show
      resources :user_role_abilities, only: %i[create destroy]
      resources :users, only: %i[create update destroy]

      resources :entity_fields, only: %i[create update destroy]
    end
  end
end
