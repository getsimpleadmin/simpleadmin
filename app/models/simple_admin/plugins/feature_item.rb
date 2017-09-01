module SimpleAdmin
  module Plugins
    class FeatureItem < SimpleAdmin::Plugins::Base
      belongs_to :plugin
      belongs_to :object, polymorphic: true
    end
  end
end
