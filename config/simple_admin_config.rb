require 'singleton'

class SimpleAdmin
  def self.menu
    SimpleAdmin::Menu
  end

  class Menu
    include Singleton

    attr_accessor :items

    def self.configure(&block)
      self.instance.items = []
      instance_eval &block
    end

    def self.menu_item(&block)
      MenuItem.new(&block)
    end

    def self.items
      self.instance.items
    end
  end

  class MenuItem
    attr_accessor :title, :route

    def initialize(&block)
      instance_eval &block
    end

    def title(&block)
      self.title = block.call
    end

    def route(&block)
      self.route = block.call
      Menu.instance.items << self
    end
  end
end

SimpleAdmin.menu.configure do
  menu_item do
    title { 'Test' }
    route { 'Test' }
  end

  menu_item do
    title { 'Another' }
    route { 'Another' }
  end
end


  # SimpleAdmin.menu.configure do
  #   menu_item do
  #     title { I18n.t('simple_admin.menu_items.settings') }
  #     route { resources :settings, only: [:index, :update] }
  #   end
  #
  #   menu_item do
  #     title { I18n.t('simple_admin.menu_items.users') }
  #     route { resources :users }
  #   end
  #
  #   menu_item do
  #     title { I18n.t('simple_admin.menu_items.user_roles') }
  #
  #     route do
  #       resources :user_roles
  #       resources :user_permissions, only: [:create, :update, :destroy]
  #     end
  #   end
  # end
