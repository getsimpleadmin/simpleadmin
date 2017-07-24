module SimpleAdmin
  class Setting < Base

    def self.default_language
      find_by(name: :default_language).value
    end

    def self.site_url_staging
      find_by(name: :site_url_staging).value
    end

    def self.site_url_production
      find_by(name: :site_url_production).value
    end
  end
end
