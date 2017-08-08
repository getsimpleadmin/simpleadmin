module SimpleAdmin
  class Widget < Base
    extend FriendlyId

    translates :label
    
    friendly_id :name, use: :slugged

    def enabled?
      status
    end
  end
end
