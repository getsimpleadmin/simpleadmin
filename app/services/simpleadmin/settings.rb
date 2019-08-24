# frozen_string_literal: true

require 'singleton'

class Simpleadmin::Settings
  include Singleton

  attr_accessor :enable_analytic

  def self.enable_analytic
    return true if instance.enable_analytic.nil?

    instance.enable_analytic
  end

  def self.enable_analytic=(value)
    instance.enable_analytic = value
  end
end
