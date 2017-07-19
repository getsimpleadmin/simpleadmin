require 'bundler/setup'
require 'pry'

require 'action_controller'
require 'action_controller/railtie'

require File.expand_path("../../spec/example_app/config/environment", __FILE__)

require 'active_support/all'
require 'rspec/rails'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
