module SimpleAdmin
  module MenuDsl
    extend self

    # Menu DSL methods
    #
    # @example
    #  SimpleAdmin::Config.setup do |config|
    #    config.menu.configure do
    #      item do
    #        label { 'Settings' }
    #        icon  { 'si-settings' }
    #
    #        route { resources :settings, only: [:index, :update] }
    #      end
    #    end
    #  end
    #
    # @since 0.1.1

    def configure(&block)
      instance_eval &block
    end

    def item(&block)
      Menu::Item.new(&block)
    end
  end
end
