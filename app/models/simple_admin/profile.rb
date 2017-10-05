module SimpleAdmin
  class Profile < Base
    belongs_to :user, optional: true
  end
end
