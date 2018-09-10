module SimpleAdmin
  class VersionsController < BaseController
    def show
      render json: {
        version: Simpleadmin::VERSION
      }
    end
  end
end
