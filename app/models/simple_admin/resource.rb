# frozen_string_literal: true

class SimpleAdmin::Resource
  include ActiveModel::Model

  def initialize(attribute_names)
    mass_assign_attributes(attribute_names)
  end

  def mass_assign_params(attributes)
    attributes.to_h.keys.each do |attribute_name|
      public_send("#{attribute_name}=", attributes[attribute_name])
    end
  end

  private

  def mass_assign_attributes(attribute_names)
    attribute_names.each do |attribute_name|
      self.class.send(:attr_accessor, attribute_name)
    end
  end
end
