module SimpleAdminHelper
  def resource_link(resource, method, prefix = nil, namespace = nil)
    model_klass_name = resource.class.name.demodulize.underscore

    case method
    when :create
      model_klass_name = model_klass_name.pluralize
    when :new
      prefix = :new
    when :edit
      prefix = :edit
    end

    resource_path = "#{namespace}_#{model_klass_name}_path"
    resource_path = "#{prefix}_#{resource_path}" if prefix.present?

    public_send(resource_path, resource, current_locale)
  end

  def str_to_method(string)
    eval(string)
  end
end
