require 'simple_admin/version'
require 'pry'

module SimpleAdmin

  autoload :Base, 'simple_admin/models/base'

  autoload :Page, 'simple_admin/models/page'
  autoload :Post, 'simple_admin/models/post'
  autoload :Category, 'simple_admin/models/category'

  autoload :Widget, 'simple_admin/widget'

  autoload :Views, 'simple_admin/views'

  class << self
  end
end

require 'simple_admin/engine'
