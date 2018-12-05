module EntityFieldTypes
  class StatusField
    def run(field_name, model_klass_name)
      resource_klass = model_klass_name.constantize
      resource_klass.public_send(field_name.pluralize).keys
    end
  end
end
