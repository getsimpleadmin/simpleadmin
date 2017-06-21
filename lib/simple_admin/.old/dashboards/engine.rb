require 'singleton'

module SimpleAdmin
  module Dashboards
    class Engine
      attr_accessor :columns, :model

      def self.build(model, &block)
        new(model, &block)
      end

       def initialize(model, &block)
         @model = model
         @columns = {
           model => {
             index: []
           }
         }

         instance_eval &block
       end

      def index(&block)
        SimpleAdmin::Dashboards::Attributes.new(@model, self, &block)
      end
    end
  end
end
