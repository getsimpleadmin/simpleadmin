class CreateSimpleAdminEntityFieldTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :simple_admin_entity_field_types do |t|
      t.string :name
      t.string :template

      t.boolean :inbuilt, default: false

      t.timestamps null: false
    end
  end
end
