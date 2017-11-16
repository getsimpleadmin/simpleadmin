require 'singleton'

module SimpleAdmin
  class Config
    include Singleton

    attr_accessor :per_page

    class << self
      def setup
        yield(instance)
      end

      def per_page
        instance.per_page
      end
    end
  end
end
