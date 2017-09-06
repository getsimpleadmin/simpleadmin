module SimpleAdmin
  class LayoutPlugin < Base
    belongs_to :layout
    belongs_to :plugin
  end
end
