module SimpleAdmin
  class FieldSetting
    include ActiveModel::Model

    attr_accessor :name, :label, :value
  end
end
