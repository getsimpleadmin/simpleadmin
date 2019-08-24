# frozen_string_literal: true

module Simpleadmin::Registration::Steps
  class Project < Base
    def resource
      current_user.project
    end

    def next_step_path
      admin_setup_step_path(:models)
    end

    def previous_step_path
      admin_setup_step_path(:account)
    end

    def step_done?
      result = resource.valid? && resource.enabled?
      resource.errors.clear

      result
    end

    def previous_step_done?
      true
    end

    def controller_redirect_notice
      response_code = resource.enabled_request_response_code

      if response_code.eql?('404')
        'Step not done, please check project URL'
      elsif response_code.eql?('403')
        'Step not done, please check project secret key'
      end
    end

    def permitted_params
      %i[name secret_key url_scheme url_domain]
    end

    def required_param
      :project
    end
  end
end
