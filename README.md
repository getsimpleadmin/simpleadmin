# SimpleAdmin

[![Build Status](https://travis-ci.org/evil-raccoon/simple-admin.svg?branch=master)](https://travis-ci.org/evil-raccoon/simple-admin)
[![codecov](https://codecov.io/gh/evil-raccoon/simple_admin/branch/master/graph/badge.svg)](https://codecov.io/gh/evil-raccoon/simple_admin)
[![Inline docs](http://inch-ci.org/github/evil-raccoon/simple_admin.svg)](http://inch-ci.org/github/evil-raccoon/simple_admin)

A framework for creating admin dashboards in an instant.
[Try the demo][demo].

## Getting started
Add SimpleAdmin to your Gemfile and run bundle:

![simple_admin](https://i.imgur.com/s1fGVRq.png)

```ruby
gem 'simple-admin'
```

The following generators will create rolify initializer and core migrations.  

```ruby
rails generate simple_admin:install
rails generate simple_admin:migration

rails db:migrate
```

Restart your server, and visit [http://localhost:3000/admin/system/entities](http://localhost:3000/admin/system/entities) for authentication.

### Authentication

Simple admin is very flexible solution, so you can use any gems for that purposes, all you need is just create `app/controllers/simple_admin/admin/application_controller.rb` and remove current_user and authenticate_user! methods with `raise NotImplemented` error and keep the following.

```ruby
  # app/controllers/simple_admin/admin/application_controller.rb

  module SimpleAdmin
    module Admin
      class ApplicationController < ActionController::Base
        layout 'simple_admin'

        # use here you authentication before action  
      end
    end
  end
```

After that create next partial:

```ruby
  # app/views/simple_admin/admin/shared/components/_logout.html.erb
  
  <ul class="nav-header pull-right">
    <li>
      <%= link_to t('simple_admin.actions.logout'), destroy_user_session_path, method: :delete %>
    </li>
  </ul>
```

## Customization
You have two different ways to customize admin panel entities and fields, first way it's to use built in generator, it automatically create all fields for form and collection pages (excepting timestamps and id). All you need is run next command:

```ruby
  rails generate simple_admin:model_entities Post
```
Next way is to create entity in administrative panel and fields for it, you can do it on the entities page (http://localhost:3000/admin/system/entities).

## Dependencies

We try to minimize the use of third-party libraries, but Simple Admin built with the following open source projects:

Tool                  | Description
--------------------- | -----------
[Kaminari]            | Paginator for Ruby webapps

[Kaminari]: https://github.com/kaminari/kaminari

## Contributing

1. Fork it ( https://github.com/evil-raccoon/simple_admin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


[CanCanCan]: https://github.com/CanCanCommunity/cancancan

## Copyright

Released under MIT License.

Copyright © 2017 Evil Raccoon.

[demo]: https://simpleadmin.herokuapp.com
