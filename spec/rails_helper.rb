require 'spec_helper'
require 'simplecov'
require 'database_cleaner'

ENV['RAILS_ENV'] ||= 'test'
SimpleCov.start

require File.expand_path("../../spec/example_app/config/environment", __FILE__)

require 'rspec/rails'

Dir[Rails.root.join("../../spec/support/**/*.rb")].each { |file| require file }

require 'factories'

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.include FactoryBot::Syntax::Methods

  config.before(:each, type: :generator) do
    allow(Rails).to receive(:root).and_return(Pathname.new(file(".")))
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

ActiveRecord::Migration.maintain_test_schema!
