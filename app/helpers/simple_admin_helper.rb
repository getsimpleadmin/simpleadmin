module SimpleAdminHelper
  def resource_link(resource, method, prefix = nil, namespace = nil)
    resource_klass = resource.class

    plural_name =
      if defined?(resource_klass.plural_name)
        resource_klass.plural_name
      else
        resource.model_name.plural
      end

    singular_name =
      if defined?(resource_klass.singular_name)
        resource_klass.singular_name
      else
        resource.model_name.singular
      end

    case method
    when :index
      resource_name = plural_name
    when :new
      resource_name = singular_name
      prefix = :new
    when :create
      resource_name = plural_name
    when :edit
      resource_name = singular_name
      prefix = :edit
    when :update
      resource_name = singular_name
    when :destroy
      resource_name = singular_name
    end

    resource_path = "#{namespace}_#{resource_name}_path"
    resource_path = "#{prefix}_#{resource_path}" if prefix.present?

    public_send(resource_path, resource, current_locale)
  end

  def resource_collection_title(resource)
    "simple_admin.admin.#{resource.model_plural_name}.index.title"
  end

  def resource_collection_link(resource, current_locale)
    public_send("admin_#{resource.model_plural_name}_path", current_locale)
  end

  def resource_active_link(resource_link)
    url_for == resource_link ? 'nav-group__open' : ''
  end

  def resource_system_active_link
    /system/.match?(url_for) ? 'nav-group__open' : ''
  end

  def str_to_method(string)
    # TODO Eval not recommended to use, think about another way
    eval(string)
  end
end
