module SimpleAdminHelper
  include SimpleAdmin::Helpers::UrlHelper

  def resources_pagination_start(per_page, current_page)
    (per_page * current_page.to_i) - (per_page - 1)
  end

  def resources_pagination_end(per_page, current_page)
    (per_page * current_page.to_i) + 1
  end
end
