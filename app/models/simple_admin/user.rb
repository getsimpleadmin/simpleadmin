# frozen_string_literal: true

class SimpleAdmin::User < SimpleAdmin::Base
  rolify

  attr_accessor :secure_digest

  devise :database_authenticatable, :trackable, :validatable

  belongs_to :project
  belongs_to :user_role

  before_validation :autogenerate_credentials!, on: :create

  def can_view?(resource_name)
    user_role.user_role_abilities.where(resource_name: resource_name).any?
  end

  private

  def autogenerate_credentials!
    secure_digest = SecureRandom.hex(8)

    self.password = secure_digest
    self.password_confirmation = secure_digest
    self.secure_digest = secure_digest
  end
end
