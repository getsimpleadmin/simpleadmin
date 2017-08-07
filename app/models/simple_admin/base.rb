if Rails::VERSION::STRING.to_i < 5
  SimpleAdmin::Base = Class.new(ActiveRecord::Base) do
    self.abstract_class = true
    self.table_name_prefix = 'simple_admin_'
  end
else
  SimpleAdmin::Base = Class.new(ApplicationRecord) do
    self.abstract_class = true
    self.table_name_prefix = 'simple_admin_'
  end
end
