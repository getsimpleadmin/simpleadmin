module SimpleAdmin
  class Entity < Base
    using Refinements::Boolean

    has_many :entity_fields

    after_create :create_default_fields!

    def model_klass
      model_klass_name.constantize
    end

    def status_humanized
      status.humanize
    end

    def inbuilt_humanized
      inbuilt.humanize
    end

    def self.form_attributes(model_klass)
      find_by(model_klass_name: model_klass.to_s).entity_fields.form.pluck(:name)
    end

    private

    def create_default_fields!
      SimpleAdmin::EntityField.create_number_field(name: :id, label: 'ID', entity: self, presentation: :collection)
    end
  end
end
