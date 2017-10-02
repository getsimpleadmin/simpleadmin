module SimpleAdmin
  class Setting < Base
    class << self
      def site_url
        find_by(name: :site_url)
      end
    end
  end
end
