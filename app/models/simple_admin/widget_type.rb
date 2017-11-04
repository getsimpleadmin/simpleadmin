module SimpleAdmin
  class WidgetType < Base
    extend FriendlyId

    friendly_id :name, use: :slugged

    has_many :widgets

    def enabled?
      status
    end
  end
end
