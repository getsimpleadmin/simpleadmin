module SimpleAdmin
  class Language < Base
    scope :enabled, -> { where(status: true) }

    def self.language_codes
      enabled.pluck(:code).join('|')
    end
  end
end
