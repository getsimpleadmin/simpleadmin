module FeatureHelpers
  def click_sub_menu_link(text)
    find('.nav-group__item.nav-group__title', text: text).click
  end
end
