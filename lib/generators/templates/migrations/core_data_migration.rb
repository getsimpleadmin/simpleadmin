class CreateSimpleAdminCoreDataMigration < ActiveRecord::Migration[5.0]
  def change
    require 'factory_bot'

    FactoryBot.create(:entity_field_type, name: :boolean,  template: 'simple_admin/fields/boolean')
    FactoryBot.create(:entity_field_type, name: :number,   template: 'simple_admin/fields/number')
    FactoryBot.create(:entity_field_type, name: :select,   template: 'simple_admin/fields/select')
    FactoryBot.create(:entity_field_type, name: :string,   template: 'simple_admin/fields/string')
    FactoryBot.create(:entity_field_type, name: :text,     template: 'simple_admin/fields/text')
    FactoryBot.create(:entity_field_type, name: :image,    template: 'simple_admin/fields/image')
    FactoryBot.create(:entity_field_type, name: :tags,     template: 'simple_admin/fields/tags')
    FactoryBot.create(:entity_field_type, name: :relation, template: 'simple_admin/fields/relation')
  end
end
