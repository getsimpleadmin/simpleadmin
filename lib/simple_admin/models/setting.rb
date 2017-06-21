module SimpleAdmin
  class Setting < Base

    def self.default_language
      find_by(name: :default_language).value
    end
  end
end
