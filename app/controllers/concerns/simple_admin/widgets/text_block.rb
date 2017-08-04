module Widgets
  module Menu
    extend ActiveSupport::Concern

    included do
      def edit
        @menus = SimpleAdmin::Widgets::TextBlock.all

        render 'simple_admin/widgets/text_blocks/edit'
      end
    end
  end
end
