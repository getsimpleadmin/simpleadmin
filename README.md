[![Build Status](https://travis-ci.org/dmitriy-strukov/simple_admin.svg?branch=master)](https://travis-ci.org/dmitriy-strukov/simple_admin)

# SimpleAdmin

## Installation
Simple Admin works with rails 5.1.3. Add it to your Gemfile:

```ruby
gem 'simple_admin', path: 'gemfiles/simple_admin'

gem 'mini_magick'
gem 'carrierwave'
```

## Getting started

```ruby
rails generate simple_admin:install
rails generate simple_admin:migration
rails generate simple_admin:routes

rails db:migrate
```

Visit [http://localhost:3000/users/sign_in](http://localhost:3000/users/sign_in)
```ruby
  login:    admin@example.com
  password: example
```
