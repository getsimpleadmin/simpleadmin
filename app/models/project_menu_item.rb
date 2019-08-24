# frozen_string_literal: true

class ProjectMenuItem < ApplicationRecord
  extend FriendlyId
  friendly_id :model_klass_name, use: :slugged

  belongs_to :project

  DEFAULT_ITEMS = [
    {
      icon: 'si-layers',
      locale: 'admin.menu.system.models',
      path: 'admin_system_models_path',
      model_klass_name: SimpleAdmin::Entity.to_s
    },
    {
      icon: 'si-puzzle',
      locale: 'admin.menu.system.widgets',
      path: 'admin_system_widgets_path',
      model_klass_name: SimpleAdmin::Widget.to_s
    },
    {
      icon: 'si-users',
      locale: 'admin.menu.system.user_roles',
      path: 'admin_system_user_roles_path',
      model_klass_name: SimpleAdmin::UserRole.to_s
    }
  ].freeze

  scope :latest, -> { order(sort_order: :asc) }

  class << self
    def model_klass_names
      DEFAULT_ITEMS.map { |menu_item| [I18n.t(menu_item[:locale]), menu_item[:model_klass_name]] }
    end

    def locales
      DEFAULT_ITEMS.map { |menu_item| I18n.t(menu_item[:locale]) }
    end

    def paths
      DEFAULT_ITEMS.map { |menu_item| menu_item[:path] }
    end

    def icons
      DEFAULT_ITEMS.map { |menu_item| menu_item[:icon] }
    end
  end
end
