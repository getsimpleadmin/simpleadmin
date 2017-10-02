module SimpleAdmin
  class UserPermission < Base

    belongs_to :role

    def model_klass
      if model_klass_name.safe_constantize.present?
        model_klass.constantize
      else
        model_klass_name.to_sym
      end
    end
  end
end
