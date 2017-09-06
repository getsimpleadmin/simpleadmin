module SimpleAdmin
  class Layout < Base
    extend FriendlyId

    friendly_id :name, use: :slugged

    has_many :layout_plugins
    has_many :plugins, through: :layout_plugins

    accepts_nested_attributes_for :layout_plugins, update_only: true
    delegate :plugin_id, :layout_id, :sort_order, to: :layout_plugins, allow_nil: true
  end
end
