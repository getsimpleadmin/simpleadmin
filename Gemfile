source 'https://rubygems.org'
gemspec

gem 'rails', '~> 5.0.0'

gem 'pry',  require: false
gem 'rdoc', require: false

gem 'faker'
gem 'pg'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-tags-input'
  gem 'rails-assets-notifyjs'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara-screenshot'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'sprockets-rails', require: 'sprockets/railtie'
end
