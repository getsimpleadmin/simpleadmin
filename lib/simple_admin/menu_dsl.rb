module SimpleAdmin
  module MenuDsl
    extend self

    def configure(&block)
      instance_eval &block
    end

    def item(&block)
      Menu::Item.new(&block)
    end
  end
end
