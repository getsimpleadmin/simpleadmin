module SimpleAdmin
  module Dashboards
    class Attributes
      def initialize(model, dashboard_klass, &block)
        @model = model
        @dashboard_klass = dashboard_klass

        instance_eval &block
      end

      def field(attrubute_name)
        @dashboard_klass.columns[@model][:index] << attrubute_name
      end
    end
end
