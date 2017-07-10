class BaseDashboard < SimpleAdmin::Dashboards::Engine
  RESOURCES = [
    :posts,
    :categories
  ]
end
