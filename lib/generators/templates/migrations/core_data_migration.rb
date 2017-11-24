class CreateSimpleAdminCoreDataMigration < ActiveRecord::Migration[5.0]
  def change
    SimpleAdmin::EntityFieldType.create(name: :boolean,  template: 'simple_admin/fields/boolean')
    SimpleAdmin::EntityFieldType.create(name: :number,   template: 'simple_admin/fields/number')
    SimpleAdmin::EntityFieldType.create(name: :select,   template: 'simple_admin/fields/select')
    SimpleAdmin::EntityFieldType.create(name: :string,   template: 'simple_admin/fields/string')
    SimpleAdmin::EntityFieldType.create(name: :text,     template: 'simple_admin/fields/text')
    SimpleAdmin::EntityFieldType.create(name: :image,    template: 'simple_admin/fields/image')
    SimpleAdmin::EntityFieldType.create(name: :tags,     template: 'simple_admin/fields/tags')
    SimpleAdmin::EntityFieldType.create(name: :relation, template: 'simple_admin/fields/relation')
  end
end
