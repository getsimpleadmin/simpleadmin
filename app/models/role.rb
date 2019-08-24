# frozen_string_literal: true

class Role < ApplicationRecord
  has_and_belongs_to_many :simple_admin_users, join_table: :simple_admin_users_roles

  belongs_to :resource, polymorphic: true, optional: true

  validates :resource_type, inclusion: { in: Rolify.resource_types }, allow_nil: true

  scopify
end
