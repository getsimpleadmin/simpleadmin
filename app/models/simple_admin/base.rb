module SimpleAdmin
  class Base < ApplicationRecord
    self.abstract_class = true
    self.table_name_prefix = 'simple_admin_'
  end
end
