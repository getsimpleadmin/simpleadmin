module SimpleAdmin
  class Profile < Base
    belongs_to :user, optional: true

    mount_uploader :avatar, AvatarUploader
  end
end
