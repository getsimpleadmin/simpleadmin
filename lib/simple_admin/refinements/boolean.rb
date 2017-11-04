module SimpleAdmin
  module Refinements
    module Boolean
      refine TrueClass do
        def humanize(format='Yes')
          format
        end
      end

      refine FalseClass do
        def humanize(format='No')
          format
        end
      end
    end
  end
end
