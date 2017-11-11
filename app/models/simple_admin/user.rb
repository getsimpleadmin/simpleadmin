module SimpleAdmin
  class User < Base
    has_one :profile, dependent: :destroy

    has_many :posts
    has_many :comments

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
