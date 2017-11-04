class CreateSimpleAdminEntityFields < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_entity_fields do |t|
      t.string :name

      t.integer :entity_field_type_id, null: false
      t.integer :entity_id, null: false

      t.integer :display

      t.timestamps null: false
    end
  end
end
