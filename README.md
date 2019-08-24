# SimpleAdmin

SimpleAdmin provides builder for administrative dashboards, it's fit for Web / Mobile / API. Cloud or your own servers, depends on your choice and requirements.

All common admin dashboard tasks like content create / update / delete operations, charts, invite colleagues. It's the self-hosted open-source version to use on own servers.

[Example Application][demo]

## Requirements

- [Ruby ~> 2.6.3][ruby]
- Rails ~> 5.2.1
- PostgreSQL >= 9.3.10
- NodeJS >= 8.16.0
- Redis

## Configuration

To improve SimpleAdmin and to better understand the most popular features, users activity, we plugged an analytical instrument. To disable it:

```ruby
# config/initializers/settings.rb

Simpleadmin::Settings.enable_analytic = false
```

## Manual Installation

![simple_admin](https://getsimpleadmin-staging.herokuapp.com/assets/demo-b3f2234a3a7b9a269e0d12febc0e4fe45c4150457b98affa50d2ff9dbe3460c2.jpg)

## Step 1 (Project installation)

After installing all required dependencies above, copy the repository locally 

```
git clone git@github.com:getsimpleadmin/simpleadmin.git
```
Install gems, run migrations with the creation of database and seeds
```
bundle install && rake db:create && rake db:migrate && rake db:seed
```
And javascript dependencies
```
npm install && yarn install
```

Preferred port to run is 5000 because in most cases the main application is running on 3000 port
```
rails s -p 5000
```

Use default email `demo@example.com` and password `example` to sign in.

## Step 2 (Application integration)

To connect application you need to add API library:
- [Ruby][simpleadminruby]
- [Node.js][simpleadminnodejs]

If you didn't find a library for your programming language or framework, please [create an issue][newissue]. After login, you'll see the next form, to proceed, please use a secret key that you've created while installation API library.

![img](https://i.imgur.com/31xrx6K.png)

If all right you'll see the final step where you can choose tables to use in the admin dashboard
<br>

![img](https://i.imgur.com/8NS7sBq.png)

## Step 3 (Set up interface)

SimpleAdmin contains two main entities to change the interface of datasets

- Model
- Collection and Form fields

The model may be a product on an e-commerce website or article on a blog.

![img](https://i.imgur.com/GtzB0Gk.png)

Each model contains fields, on the image below you can see id (unique identifier) and login fields for user model.

![img](https://i.imgur.com/IF0ddH2.png)

You can see **collection fields** on the page with a list of all records

![img](https://i.imgur.com/UBeQJam.png)

And **form fields** while creation and edit a new record

![img](https://i.imgur.com/reAGJPs.png)

It's a short description of features, to find more information use [documentation](https://getsimpleadmin.com/documentation)

## Contributing

Bug reports and pull requests are welcome on GitHub at [github.com/getsimpleadmin/simpleadmin](https://github.com/getsimpleadmin/simpleadmin)

## License
The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT)

[demo]: https://getsimpleadmin.com/demo/admin/customer/resources
[simpleadminruby]: https://github.com/getsimpleadmin/simpleadmin-ruby
[simpleadminnodejs]: https://github.com/getsimpleadmin/simpleadmin-nodejs
[newissue]: https://github.com/getsimpleadmin/simpleadmin/issues/new
[ruby]: https://rvm.io/rvm/install