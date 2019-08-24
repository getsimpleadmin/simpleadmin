# frozen_string_literal: true

module Simpleadmin::Registration::Steps
  class Base
    include Rails.application.routes.url_helpers

    STEPS = {
      'project' => Simpleadmin::Registration::Steps::Project,
      'models' => Simpleadmin::Registration::Steps::Model
    }.freeze

    def initialize(current_user:, resource_id:)
      @current_user = current_user
      @resource_id = resource_id
    end

    def resource
      raise NotImplementedError, 'Please follow the unified interface, add method #resource'
    end

    def previous_step_done?
      raise NotImplementedError, 'Please follow the unified interface, add method #previous_step_done?'
    end

    def previous_step_path
      raise NotImplementedError, 'Please follow the unified interface, add method #previous_step_path'
    end

    def controller_redirect_notice
      raise NotImplementedError, 'Please follow the unified interface, add method #controller_redirect_notice'
    end

    def next_step
      raise NotImplementedError, 'Please follow the unified interface, add method #next_step'
    end

    def step_done?
      raise NotImplementedError, 'Please follow the unified interface, add method #step_done?'
    end

    def permitted_params
      raise NotImplementedError, 'Please follow the unified interface, add method #permitted_params'
    end

    def required_param
      raise NotImplementedError, 'Please follow the unified interface, add method #required_param'
    end

    private

    attr_reader :current_user, :resource_id
  end
end
