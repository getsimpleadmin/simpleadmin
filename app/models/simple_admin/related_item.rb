module SimpleAdmin
  class RelatedItem < Base
    belongs_to :object, polymorphic: true
    belongs_to :related_object, polymorphic: true
  end
end
