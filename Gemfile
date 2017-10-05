source 'https://rubygems.org'
gemspec

gem 'rails', '~> 5.0.0'

gem 'rdoc', require: false
gem 'pry',  require: false

gem 'pg'
gem 'faker'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-tags-input'
  gem 'rails-assets-notifyjs'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'

end

group :test do
  gem 'rails-controller-testing'
  gem 'sprockets-rails', require: 'sprockets/railtie'
  gem 'shoulda-matchers'
  gem 'capybara-screenshot'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'simplecov'
end
