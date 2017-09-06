module SimpleAdminHelper
  def resource_link(resource, method, namespace=:admin)
    singular_name = resource.class.model_name.element
    plural_name = singular_name.pluralize

    postfix = :path

    case method
    when :new
      resource_path = "#{method}_#{namespace}_#{singular_name}_#{postfix}"
    when :create
      resource_path = "#{namespace}_#{plural_name}_#{postfix}"
    when :edit
      resource_path = "#{method}_#{namespace}_#{singular_name}_#{postfix}"
    when :update
      resource_path = "#{namespace}_#{singular_name}_#{postfix}"
    when :destroy
      resource_path = "#{namespace}_#{singular_name}_#{postfix}"
    end

    public_send(resource_path, resource.id)
  end

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
