# SimpleAdmin

[![Build Status](https://travis-ci.org/dmitriy-strukov/simple_admin.svg?branch=master)](https://travis-ci.org/dmitriy-strukov/simple_admin)
[![Code Climate](https://codeclimate.com/github/dmitriy-strukov/simple_admin/badges/gpa.svg)](https://codeclimate.com/github/dmitriy-strukov/simple_admin)

Simple Admin is a Ruby on Rails framework for creating admin dashboards in an instant.

## Getting started
Simple Admin supports only Rails 5.1.3.
Add it to your Gemfile:

```ruby
gem 'simple_admin', git: 'https://github.com/dmitriy-strukov/simple_admin.git'
```

Simple Admin also required the following gems:

```ruby
gem 'mini_magick'
gem 'carrierwave'
```

The following generators will create devise, rolify initializers, core migration and devise route for SimpleAdmin::User.  

```ruby
rails generate simple_admin:install
rails generate simple_admin:migration
rails generate simple_admin:routes

rails db:migrate
```

Restart your server, and visit [http://localhost:3000/users/sign_in](http://localhost:3000/users/sign_in) for authentication.

Default admin credentials:

```ruby
  login:    admin@example.com
  password: example
```
