class CreateSimpleAdminEntityFieldTypesMigration < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_entity_field_types do |t|
      t.string :name
      t.string :template

      t.timestamps null: false
    end
  end
end
