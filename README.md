# SimpleAdmin

[![Build Status](https://travis-ci.org/dmitriy-strukov/simple_admin.svg?branch=master)](https://travis-ci.org/dmitriy-strukov/simple_admin)
[![Code Climate](https://codeclimate.com/github/dmitriy-strukov/simple_admin/badges/gpa.svg)](https://codeclimate.com/github/dmitriy-strukov/simple_admin)
[![Inline docs](http://inch-ci.org/github/dmitriy-strukov/simple_admin.svg)](http://inch-ci.org/github/dmitriy-strukov/simple_admin)

Simple Admin is a Ruby on Rails framework for creating admin dashboards in an instant.

## Getting started
Simple Admin supports only Rails 5.1.3.
Add it to your Gemfile:

```ruby
gem 'simple_admin', git: 'https://github.com/dmitriy-strukov/simple_admin.git'
```

The following generators will create rolify initializer and core migrations.  

```ruby
rails generate simple_admin:install
rails generate simple_admin:migration

rails db:migrate
```

Restart your server, and visit [http://localhost:3000/users/sign_in](http://localhost:3000/users/sign_in) for authentication.

Default admin credentials:

```ruby
  login:    admin@example.com
  password: example
```

### Devise integration

```ruby
  # config/routes.rb

  Rails.application.routes.draw do
    devise_for :users, class_name: 'SimpleAdmin::User'
  end
```

```ruby
  # app/models/simple_admin/user.rb

  module SimpleAdmin
    class User < Base
      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

      ...
    end
  end
```

Remove current_user and authenticate_user! methods

```ruby
  # app/controllers/simple_admin/admin/application_controller.rb

  module SimpleAdmin
    module Admin
      class ApplicationController < ActionController::Base
        layout 'simple_admin'

        before_action :authenticate_user!

        private

          def current_ability
            SimpleAdmin::Ability.new(current_user)
          end
      end
    end
  end
```
