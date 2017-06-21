require 'pry'

module SimpleAdmin; end

class SimpleAdmin::Dashboard
  attr_accessor :columns, :model

  def self.build(model, &block)
    $simple_admin_dashboard || new(model, &block)

    $simple_admin_dashboard = self
  end

   def initialize(model, &block)
     @model = model
     @columns = {
       model => {
         index: []
       }
     }

     instance_eval &block
   end

  def index(&block)
    SimpleAdmin::Attributes.new(@model, self, &block)
  end
end

class SimpleAdmin::Attributes
  def initialize(model, dashboard_klass, &block)
    @model = model
    @dashboard_klass = dashboard_klass

    instance_eval &block
  end

  def field(attrubute_name)
    @dashboard_klass.columns[@model][:index] << attrubute_name
  end
end

class SimpleAdmin::Post; end


SimpleAdmin::Dashboard.build SimpleAdmin::Post do
  index do
    field :id
    field :title
  end
end
