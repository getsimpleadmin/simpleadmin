source 'https://rubygems.org'

# Specify your gem's dependencies in simple_admin.gemspec
gemspec

gem 'rdoc'

gem 'devise'
gem 'faker'
gem 'carrierwave'
gem 'mini_magick'

source 'https://rails-assets.org' do
  gem 'rails-assets-notifyjs'
  gem 'rails-assets-jquery-tags-input'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-rails'
end

group :test do
  gem 'pg'

  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'sprockets-rails', require: 'sprockets/railtie'

  gem 'shoulda-matchers'

  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'simplecov'
end
