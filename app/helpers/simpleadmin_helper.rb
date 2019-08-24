# frozen_string_literal: true

module SimpleadminHelper
  def enable_analytic?
    Simpleadmin::Settings.enable_analytic
  end

  def week_days(format = '%A')
    6.downto(0).map do |day_index|
      day_index.days.from_now.strftime(format)
    end
  end

  def sort_order(order)
    if order == 'asc'
      :desc
    elsif order == 'desc'
      :asc
    end
  end

  def collection_tab?(current_tab)
    return false if current_tab.blank?

    current_tab.to_sym == :collection
  end

  def form_tab?(current_tab)
    return false if current_tab.blank?

    current_tab.to_sym == :form
  end
end
