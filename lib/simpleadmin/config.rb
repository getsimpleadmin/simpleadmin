require 'singleton'

module Simpleadmin
  class Config
    include Singleton

    API_TEST_MODE = false

    def api_test_mode
      @api_test_mode || API_TEST_MODE
    end

    attr_writer :api_test_mode

    def self.setup
      yield(instance)
    end
  end
end
