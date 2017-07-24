ENV["RAILS_ENV"] = "test"

require 'bundler/setup'
require 'pry'

require 'action_controller'
require 'active_record'
require 'action_controller/railtie'

require File.expand_path("../../spec/example_app/config/environment", __FILE__)

require 'active_support/all'
require 'rspec/rails'
require 'capybara-screenshot/rspec'

root = Pathname.new(Dir.pwd)

Dir[root.join("spec/support/**/*.rb")].each { |file| require file }
Dir[root.join("spec/factories/**/*.rb")].each { |file| require file }

Capybara::Screenshot.autosave_on_failure = true

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    SimpleAdmin::Setting.find_or_create_by(name: :default_language, value: :ru)
  end

  config.include FeatureHelpers, type: :feature
end

ActiveRecord::Migration.maintain_test_schema!
