require 'simple_admin/version'

module SimpleAdmin
  autoload :Base, 'simple_admin/models/base'
  autoload :Page, 'simple_admin/models/page'
  autoload :Post, 'simple_admin/models/post'
  autoload :Category, 'simple_admin/models/category'

  autoload :Entity, 'simple_admin/models/entity'
  autoload :EntityField, 'simple_admin/models/entity_field'
  autoload :EntityFieldType, 'simple_admin/models/entity_field_type'

  autoload :Setting, 'simple_admin/models/setting'

  autoload :Widget, 'simple_admin/widget'
  autoload :Views, 'simple_admin/views'

  class << self
  end
end

require 'simple_admin/engine'
