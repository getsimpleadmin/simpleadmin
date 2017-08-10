module SimpleAdmin
  class Widget < Base
    extend FriendlyId

    translates :label

    friendly_id :name, use: :slugged

    belongs_to :widget_type
  end
end
