module SimpleAdmin
  module Menu
    extend self

    def configure(&block)
      instance_eval &block
    end

    def item(&block)
      binding.pry
      Item.new(&block)
    end
  end
end
