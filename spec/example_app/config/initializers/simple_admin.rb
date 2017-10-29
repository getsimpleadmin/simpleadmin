SimpleAdmin::Config.setup do |config|
  config.per_page = 10

  config.menu.configure do
    item do
      label { 'Users' }
      icon  { 'si-users' }

      route { resources :users }
    end

    item do
      label { 'User Roles' }
      icon  { 'si-user-follow' }

      route { resources :user_roles }
    end
  end
end
