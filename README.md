# SimpleAdmin

[![Build Status](https://travis-ci.org/evil-raccoon/simple-admin.svg?branch=master)](https://travis-ci.org/evil-raccoon/simple-admin)
[![codecov](https://codecov.io/gh/evil-raccoon/simple_admin/branch/master/graph/badge.svg)](https://codecov.io/gh/evil-raccoon/simple_admin)
[![Inline docs](http://inch-ci.org/github/evil-raccoon/simple_admin.svg)](http://inch-ci.org/github/evil-raccoon/simple_admin)

https://getsimpleadmin.com

A small API library to connect your application with SimpleAdmin service and create admin dashboards in an instant.

## Getting started

![simple_admin](https://i.imgur.com/s1fGVRq.png)

Add SimpleAdmin to your Gemfile and run bundle:

```ruby
gem 'simple-admin'
```

After that, you need to mount simple admin built-in routes:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount_for_simple_admin
end
```

Create initializer, add your secret key and restart server

```ruby
# config/initializers/simpleadmin.rb
ENV['SIMPLE_ADMIN_SECRET_KEY'] = 'SECRET_KEY'
```

## Contributing

1. Fork it ( https://github.com/evil-raccoon/simple_admin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Released under MIT License.

Copyright © 2018 Evil Raccoon.
