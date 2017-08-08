module SimpleAdmin
  module Widgets
    module TextBlock
      extend ActiveSupport::Concern

      included do
        def edit
          @text_block = SimpleAdmin::Widgets::TextBlock.all

          render 'simple_admin/widgets/text_blocks/edit'
        end
      end
    end
  end
end
