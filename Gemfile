source 'https://rubygems.org'

# Specify your gem's dependencies in simple_admin.gemspec
gemspec

gem 'rdoc'

gem 'carrierwave'
gem 'devise'
gem 'faker'
gem 'mini_magick'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-tags-input'
  gem 'rails-assets-notifyjs'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'pg'

  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'sprockets-rails', require: 'sprockets/railtie'

  gem 'shoulda-matchers'

  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'simplecov'
end
