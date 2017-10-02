module SimpleAdmin
  class Role < Base
    has_and_belongs_to_many :simple_admin_users, join_table: :simple_admin_users_simple_admin_roles

    belongs_to :resource,
               polymorphic: true,
               optional: true

    has_many :user_permissions

    validates :resource_type,
              inclusion: { in: Rolify.resource_types },
              allow_nil: true

    scopify

    def self.names
      pluck(:name)
    end
  end
end
