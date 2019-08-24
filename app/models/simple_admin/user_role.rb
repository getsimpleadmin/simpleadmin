# frozen_string_literal: true

class SimpleAdmin::UserRole < SimpleAdmin::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :project

  has_many :user_role_abilities, dependent: :destroy
  has_many :users, dependent: :destroy

  validate :name_uniqueness

  private

  def name_uniqueness
    duplicate = project.user_roles.find_by(name: name)

    errors.add(:name, 'you already using this name') if duplicate.present? && duplicate != self
  end
end
