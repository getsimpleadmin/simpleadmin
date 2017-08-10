module SimpleAdmin
  class WidgetFeatureItem < Base
    belongs_to :object, polymorphic: true
  end
end
