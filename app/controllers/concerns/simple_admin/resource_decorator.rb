module SimpleAdmin
  module ResourceDecorator
    extend ActiveSupport::Concern

    included do
      def self.controller_name
        name.gsub(/(^(.+?)::Admin::)/, '')
      end

      def self.decorator_class
        "#{controller_name}Decorator".constantize
      rescue
        nil
      end

      include decorator_class if decorator_class.present?
    end
  end
end
