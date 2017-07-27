module Admin
  class BaseController < ApplicationController
    layout 'simple_admin'

    include SimpleAdmin::ResourceFields
    include SimpleAdmin::ResourceCrud

    before_action :authenticate_user!
    before_action :respond_with_locale

    private

    def respond_with_locale
      I18n.locale = params[:locale]
    end
  end
end
