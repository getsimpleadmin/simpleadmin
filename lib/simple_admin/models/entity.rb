module SimpleAdmin
  class Entity < Base
    attr_accessor :collection_name

    has_many :entity_fields

    def self.collection_names
      SimpleAdmin::Entity.all.map { |entity| [entity.name, entity.collection_name] }
    end

    def collection_name
      name.demodulize.downcase.pluralize
    end
  end
end
