module Admin
  class BaseController < ActionController::Base
    layout 'simple_admin'

    attr_reader :controller_entity_name

    before_action :extract_entity!

    private

    def extract_entity!
      @controller_entity_name = self.class.name.gsub(/(^(.+?)::|Controller)/, '').underscore
    end
  end
end
