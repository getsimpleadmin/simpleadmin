require 'simple_admin/dynamic_actions'
require 'simple_admin/dynamic_controllers'

Rails.application.routes.draw do
  namespace :admin do
    root 'dashboard#index'

    get 'dashboard' => 'dashboard#index'

    BaseDashboard::INITIALIZED_RESOURCES.each do |collection_name|
      resources collection_name

      dynamic_controller = SimpleAdmin::DynamicControllers.new(collection_name)
      dynamic_controller.set!

      SimpleAdmin::DynamicActions.set!(dynamic_controller.get_klass_name, collection_name)
    end
  end
end
