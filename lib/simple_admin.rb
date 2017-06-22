require 'simple_admin/version'
require 'pry'

module SimpleAdmin
  autoload :BaseController, 'simple_admin/base_controller'
  autoload :PagesController, 'simple_admin/pages_controller'

  autoload :Page,   'simple_admin/page'
  autoload :Widget, 'simple_admin/widget'

  autoload :Views, 'simple_admin/views'

  class << self
  end
end

require 'simple_admin/engine'
