module SimpleAdmin
  class Entity < Base
    attr_accessor :collection_name

    has_many :entity_fields

    before_save :set_model_plural_name!
    before_save :reload_routes!

    def self.collection_names
      SimpleAdmin::Entity.all.map { |entity| [entity.model_klass_name, entity.model_plural_name] }
    end

    def self.form_attributes(model_klass)
      find_by(model_klass_name: model_klass.to_s).entity_fields.form.pluck(:name)
    end

    private

    def set_model_plural_name!
      self.model_plural_name = SimpleAdmin.core_models[model_klass_name.constantize] || model_klass_name.constantize.model_name.plural
    end

    def reload_routes!
      Rails.application.routes_reloader.reload!
    end
  end
end
