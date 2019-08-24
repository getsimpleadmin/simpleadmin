# frozen_string_literal: true

class EntityFieldValidators::AssociationFieldValidator < ActiveModel::Validator
  def validate(resource)
    resource.errors.add(:base, 'You can use this field only in form') if resource.collection?
  end
end
