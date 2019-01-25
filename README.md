[![Build Status](https://secure.travis-ci.org/getsimpleadmin/simpleadmin-rails.svg?branch=master)](http://travis-ci.org/getsimpleadmin/simpleadmin-rails) [![codecov.io](https://codecov.io/github/getsimpleadmin/simpleadmin-rails/coverage.svg?branch=master)](https://codecov.io/github/getsimpleadmin/simpleadmin-rails?branch=master)[![Gem Version](https://badge.fury.io/rb/simpleadmin.svg)](https://rubygems.org/gems/simpleadmin)[![Maintainability](https://api.codeclimate.com/v1/badges/ca0015b11992514879c5/maintainability)](https://codeclimate.com/github/getsimpleadmin/simpleadmin-rails/maintainability)

# [SimpleAdmin](http://getsimpleadmin.com)

SimpleAdmin is a service for people with no special skills that enables a simple change of interface and decrease of your costs on a webpage development.

You do not need to waste your time on development and technical support. The Simple Admin team will help you pay focus on the key thing – your Product.

This is small API library to connect your application with SimpleAdmin service.

[Example Application][demo]

## Requirements

- Ruby ~> 2.3;
- Rails ~> 5.0;

## Installation

![simple_admin](https://getsimpleadmin.com/assets/browser-60e23472a81b90d1de2caf52e02b982cba4d1db4215626352476670deed9dd25.png)

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
./ngrok http 3000
```

Copy your Forwadding URL (http://exampleapp.ngrok.io) and use it when you will be creating a project (column url).

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
