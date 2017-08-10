module SimpleAdmin
  class Setting < Base
    translates :label

    def self.default_language
      find_by(name: :default_language).value
    end

    def self.site_url
      find_by(name: :site_url).value
    end
  end
end
