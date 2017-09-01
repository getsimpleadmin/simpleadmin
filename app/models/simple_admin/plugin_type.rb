module SimpleAdmin
  class PluginType < Base
    include AASM

    has_many :plugins

    def status_humanized
      if active?
        :Disable
      else
        :Activate
      end
    end

    aasm column: :status do
      state :inactive, initital: true
      state :active

      event :activate do
        transitions from: :inactive, to: :active
      end

      event :inactivate do
        transitions from: :active, to: :inactive
      end
    end
  end
end
