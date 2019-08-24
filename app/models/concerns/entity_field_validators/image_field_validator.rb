# frozen_string_literal: true

class EntityFieldValidators::ImageFieldValidator < ActiveModel::Validator
  def validate(resource)
    resource.errors.add(:base, 'You can use this field only in collection') if resource.form?
  end
end
