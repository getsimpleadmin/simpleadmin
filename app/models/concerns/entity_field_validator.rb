# frozen_string_literal: true

class EntityFieldValidator < ActiveModel::Validator
  MAPPER = {
    'image' => EntityFieldValidators::ImageFieldValidator,
    'association' => EntityFieldValidators::AssociationFieldValidator
  }.freeze

  def validate(resource)
    MAPPER[resource.entity_field_type.name].new.validate(resource) if MAPPER[resource.entity_field_type.name].present?
  end
end
