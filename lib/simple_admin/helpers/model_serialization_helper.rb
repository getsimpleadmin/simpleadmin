module SimpleAdmin
  module ModelSerializationHelper
    include ActionView::Helpers::TextHelper

    IGNORED_ATTRIBUTES = %w[created_at updated_at].freeze

    def to_entity_params
      klass = self.class.name

      {
        label: klass,
        model_klass_name: klass.parameterize,
        model_plural_name: klass.parameterize.pluralize,
        status: false
      }
    end

    def to_entity_fields_params
      targeted_attributes.each do |attribute|
        #TODO
      end
    end

    def targeted_attributes
      attributes.except(*IGNORED_ATTRIBUTES)
    end
  end
end
