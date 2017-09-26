module SimpleAdmin
  module Helpers
    module BooleanHelper
      extend ActiveSupport::Concern

      included do
        using Refinements::Boolean

        class << self
          def boolean_fields(*model_column_names)
            model_column_names.each do |column_name|
              build_humanized_method!(column_name)
              build_predicate_method!(column_name)
            end
          end

          private

            def build_humanized_method!(column_name)
              postfix = :humanized

              define_method "#{column_name}_#{postfix}" do
                public_send(column_name).humanize
              end
            end

            def build_predicate_method!(column_name)
              define_method "#{column_name}?" do
                public_send(column_name)
              end
            end
        end
      end
    end
  end
end
