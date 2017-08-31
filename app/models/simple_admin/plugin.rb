module SimpleAdmin
  class Plugin < Base
    belongs_to :plugin_type

    # - - - FEATURED PLUGIN - - - #
    has_many :feature_items, class_name: 'SimpleAdmin::Plugins::FeatureItem', dependent: :destroy

    accepts_nested_attributes_for :feature_items, update_only: true
    delegate :object_id, :object_type, to: :feature_items, allow_nil: true
  end
end
