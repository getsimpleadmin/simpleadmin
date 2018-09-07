[![Gem Version](https://badge.fury.io/rb/simpleadmin.svg)](https://rubygems.org/gems/simpleadmin)
[![Gitter](https://img.shields.io/badge/gitter-join%20chat%20%E2%86%92-brightgreen.svg)](https://gitter.im/simpleadmin-rails/Lobby)


# SimpleAdmin

SimpleAdmin allows you to create a personalized administrative panel for your business and edit it without special knowledge in programming and works with any stack, because you are not tied to a specific programming language.

This is small API library to connect your application with SimpleAdmin service. 

[Example Application][demo]

## Requirements

- Ruby ~> 2.3;
- Rails ~> 5.0;

## Installation

![simple_admin](https://image.ibb.co/mTjOpe/simpleadmin_preview.png)

Add SimpleAdmin to your application's Gemfile:

```ruby
gem 'simpleadmin'
```

And then run:

```ruby
bundle install
```
**NOTE**: If you want to test your local project you'll needing to install [ngrok][ngrok] and run following command:
```ruby
ngrok http 3000
```

Copy your forwarding URL and use it when you will be creating a project (column url).

## Configuration

Add method `mount_simpleadmin` to your routes file to mount simpleadmin built-in routes:

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

Bug reports and pull requests are welcome on GitHub at https://github.com/getsimpleadmin/simpleadmin.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[demo]: https://getsimpleadmin.com/en/demo/admin/resources?model_klass_name=Post
[ngrok]: https://ngrok.com/
