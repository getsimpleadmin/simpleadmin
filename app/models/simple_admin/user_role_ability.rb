# frozen_string_literal: true

class SimpleAdmin::UserRoleAbility < SimpleAdmin::Base
  extend FriendlyId
  friendly_id :resource_name, use: :slugged

  enum action_name: %i[manage read]

  belongs_to :user_role

  scope :latest, -> { order(sort_order: :asc) }

  validate :resource_name_uniqueness

  private

  def resource_name_uniqueness
    duplicate = user_role.user_role_abilities.find_by(resource_name: resource_name)

    errors.add(:name, 'you already using this resource name') if duplicate.present? && duplicate != self
  end
end
