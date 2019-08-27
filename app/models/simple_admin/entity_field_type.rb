# frozen_string_literal: true

class SimpleAdmin::EntityFieldType < SimpleAdmin::Base
  belongs_to :entity_field, optional: true

  validate :view_templates_presence

  private

  def view_templates_presence
    validate_collection_template!
    validate_form_template!
    validate_show_template!
  end

  def validate_collection_template!
    collection_template_path = "app/views/#{template}/_collection.*"

    errors.add(:base, 'Collection template is missing') unless template_exists?(collection_template_path)
  end

  def validate_form_template!
    form_template_path = "app/views/#{template}/_form.*"

    errors.add(:base, 'Form template is missing') unless template_exists?(form_template_path)
  end

  def validate_show_template!
    show_template_path = "app/views/#{template}/_show.*"

    errors.add(:base, 'Show template is missing') unless template_exists?(show_template_path)
  end

  def template_exists?(template_path)
    !Dir.glob(template_path).empty?
  end
end
