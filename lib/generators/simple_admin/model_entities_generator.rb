module SimpleAdmin
  class ModelEntitiesGenerator < Rails::Generators::Base
    ApplicationRecord.descendants.select(&DataSourceVerifier.new).each do |model|
      puts model.name
    end
  end
end
