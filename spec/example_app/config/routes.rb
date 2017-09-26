Rails.application.routes.draw do
  devise_for :users, class_name: 'SimpleAdmin::User', controllers: { sessions: 'simple_admin/sessions' }
end
