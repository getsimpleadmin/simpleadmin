module SimpleAdmin
  class User < Base
    has_one :profile, dependent: :destroy

    accepts_nested_attributes_for :profile, update_only: true
    delegate :first_name, :last_name, to: :profile, allow_nil: true

    def full_name
      "#{first_name} #{last_name}"
    end
  end
end
