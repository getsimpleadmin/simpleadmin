# frozen_string_literal: true

class SimpleAdmin::WidgetCategory < SimpleAdmin::Base
  def template_path
    "#{template}/show"
  end
end
