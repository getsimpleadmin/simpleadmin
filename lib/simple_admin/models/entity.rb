module SimpleAdmin
  class Entity < Base
    attr_accessor :collection_name

    has_many :entity_fields

    after_save :reload_routes!

    def self.collection_names
      SimpleAdmin::Entity.all.map { |entity| [entity.name, entity.collection_name] }
    end

    def collection_name
      name.demodulize.downcase.pluralize
    end

    private

    def reload_routes!
      Rails.application.routes_reloader.reload!
    end
  end
end
