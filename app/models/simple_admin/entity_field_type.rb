module SimpleAdmin
  class EntityFieldType < Base
    include Helpers::BooleanHelper

    boolean_fields :inbuilt

    belongs_to :entity_field, optional: true

    validate :view_templates_presence, unless: :inbuilt?

    after_create :initialize_helper_methods!

    class << self
      # Define entity fields model methods to simplify creation.
      # You not need to define entity_field_type directly
      # Use:
      #   SimpleAdmin::EntityField.create_string_field(name: :title, entity: entity, presentation: :collection)
      #   SimpleAdmin::EntityField.create_number_field(name: :id, entity: entity, presentation: :collection)
      #
      # @since 0.1.0-alpha
      def build_helper_methods!
        pluck(:name).each do |field_type_name|
          SimpleAdmin::EntityField.define_singleton_method("create_#{field_type_name}_field") do |params|
            params[:entity_field_type_id] = SimpleAdmin::EntityFieldType.find_by(name: field_type_name).to_param

            create(params)
          end
        end
      end

      def reload_helper_methods!
        build_helper_methods!
      end
    end

    private

      def initialize_helper_methods!
        self.class.build_helper_methods!
      end

      def view_templates_presence
        validate_collection_template!
        validate_form_template!
      end

      def validate_collection_template!
        collection_template_path =
          if Rails.env.test?
            "spec/example_app/app/views/#{template}/_collection.*"
          else
            "app/views/#{template}/_collection.*"
          end

        errors.add(:base, 'Collection template is missing') unless template_exists?(collection_template_path)
      end

      def validate_form_template!
        form_template_path =
          if Rails.env.test?
            "spec/example_app/app/views/#{template}/_form.*"
          else
            "app/views/#{template}/_form.*"
          end

        errors.add(:base, 'Form template is missing') unless template_exists?(form_template_path)
      end

      def template_exists?(template_path)
        !Dir.glob(template_path).empty? || !Dir.glob("#{core_path}/#{template_path}").empty?
      end

      def core_path
        Gem.loaded_specs['simple-admin'].full_gem_path
      end
  end
end
