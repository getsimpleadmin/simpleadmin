module SimpleAdmin
  module EntityControllerSetter
    extend ActiveSupport::Concern

    included do
      attr_reader :controller_entity_name

      before_action :set_controller_entity_name!

      private

      def set_controller_entity_name!
        @controller_entity_name = self.class.name.gsub(/(^(.+?)::|Controller)/, '').underscore
      end
    end
  end
end
