module SimpleAdmin
  class Setting < Base
    class << self
      # def default_language
      #   find_by(name: :default_language)
      # end

      def site_url
        find_by(name: :site_url)
      end
    end
  end
end
