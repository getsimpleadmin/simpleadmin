module SimpleAdmin
  class Setting < Base
    class << self
      def site_url
        setting = find_by(name: :site_url)
        setting.value if setting.present?
      end
    end
  end
end
