# frozen_string_literal: true

class SimpleAdmin::Base < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = 'simple_admin_'
end
