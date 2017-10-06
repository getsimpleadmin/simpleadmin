module SimpleAdmin
  module Refinements
    module Boolean
      # Module with refinements for Boolean classes
      # @since 0.1.1

      refine TrueClass do
        # Refinement for TrueClass, add humanize method
        #
        # @example True class humanize
        #  true.humanize
        #  => Yes
        #  true.humanize('Example')
        #  => Example
        #
        def humanize(format='Yes')
          format
        end
      end

      refine FalseClass do
        # Refinement for FalseClass, add humanize method
        #
        # @example False class humanize
        #  false.humanize
        #  => No
        #  true.humanize('Example')
        #  => Example
        #
        def humanize(format='No')
          format
        end
      end
    end
  end
end
