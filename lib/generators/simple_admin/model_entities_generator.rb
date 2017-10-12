
module SimpleAdmin
  class ModelEntitiesGenerator < Rails::Generators::Base    
    ApplicationRecord.descendants.select(&DataSourceVerifier.new).each do |model|
      model.extend(ModelSerializationHelper)

      ActiveRecord::Base.transaction do
        entity = SimpleAdmin::Entity.create(model.to_entity_params)
        SimpleAdmin::EntityField.create(model.to_entity_fields_params)
      end
    end
  end
end
