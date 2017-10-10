module SimpleAdmin
  class UsersSimpleAdminRole < Base
    belongs_to :user
    belongs_to :role
  end
end
