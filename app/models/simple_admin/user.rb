module SimpleAdmin
  class User < Base
    rolify role_cname: 'SimpleAdmin::Role'

    has_one :profile, dependent: :destroy

    has_many :posts
    has_many :comments

    has_one :users_simple_admin_role
    has_one :role, through: :users_simple_admin_role

    has_many :user_permissions, through: :role

    alias permissions user_permissions

    accepts_nested_attributes_for :profile, update_only: true
    delegate :avatar, :first_name, :last_name, to: :profile, allow_nil: true

    after_create :create_profile!

    def full_name
      "#{first_name} #{last_name}"
    end

    private

      def create_profile!
        profile = build_profile
        profile.save
      end
  end
end
