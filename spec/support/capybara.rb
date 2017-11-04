require 'capybara/rspec'
require 'capybara/rails'

Capybara.default_max_wait_time = 1

Capybara.configure do |config|
  config.javascript_driver = :webkit
  config.default_max_wait_time = 10
  config.wait_on_first_by_default = true
end

Capybara::Webkit.configure do |config|
  config.debug = false
  config.timeout = 120
  config.block_unknown_urls
  config.skip_image_loading
end
