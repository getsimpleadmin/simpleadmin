source 'https://rubygems.org'

gemspec

ruby '2.4.1'

gem 'rails', '~> 5.0.0'

gem 'pg'
gem 'rdoc', require: false

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'codecov',   require: false
  gem 'simplecov', require: false

  gem 'database_cleaner'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'sprockets-rails', require: 'sprockets/railtie'

  gem 'pry'
end
