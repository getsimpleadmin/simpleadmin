module SimpleAdminHelper
  def resource_link(resource, method, prefix = nil, namespace = :admin)
    model_klass_name = resource.class.name.demodulize.underscore

    case method
    when :edit
      prefix = :edit
    end

    resource_path = "#{namespace}_#{model_klass_name}_path"
    resource_path = "#{prefix}_#{resource_path}" if prefix.present?

    public_send(resource_path, resource)
  end
end
