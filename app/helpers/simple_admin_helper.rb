module SimpleAdminHelper
  include SimpleAdmin::ResourceUrlHelper

  def render_plugin_actions(plugin_type)
    render "simple_admin/plugins/#{plugin_type.name}/actions", plugin_type: plugin_type
  end

  def application_model_names(namespace='SimpleAdmin')
    ApplicationRecord.descendants.map do |model|
      [model.name, model.name] unless model.name.include?(namespace)
    end.compact
  end

  # TODO: Temporary methods for demo, delete it in future

  def resource_active_link(resource_link)
    url_for == resource_link ? 'nav-group__open' : ''
  end

  def resource_system_active_link
    /system/.match?(url_for) ? 'nav-group__open' : ''
  end
end
