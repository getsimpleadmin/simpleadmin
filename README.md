# SimpleAdmin

API library to connect your application with SimpleAdmin service and create admin dashboards in an instant. [Try the demo][demo]

## Getting started

![simple_admin](https://image.ibb.co/mTjOpe/simpleadmin_preview.png)

Add SimpleAdmin to your Gemfile and run bundle:

```ruby
gem 'simpleadmin'
```

After that, you need to mount simple admin built-in routes:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount_simpleadmin
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

Copyright © 2018 SimpleAdmin.

[demo]: https://getsimpleadmin.com/en/demo/admin/resources?model_klass_name=Post
