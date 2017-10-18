module SimpleAdmin
  class UserPermission < Base
    belongs_to :role

    validate :record_uniqueness, on: :create

    def model_klass
      if model_klass_name.safe_constantize.present?
        model_klass.constantize
      else
        model_klass_name.to_sym
      end
    end

    private

      def record_uniqueness
        if already_exists?
          errors.add(:record, 'already exists')
        end
      end

      def already_exists?
        self.class.where(action: action, action_modificator: action_modificator, role: role).any?
      end
  end
end
