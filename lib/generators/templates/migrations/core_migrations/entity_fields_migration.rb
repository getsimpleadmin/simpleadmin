class CreateSimpleAdminEntityFields < ActiveRecord::Migration[5.0]
  def change
    create_table :simple_admin_entity_fields do |t|
      t.string :name
      t.string :label

      t.integer :entity_field_type_id, null: false
      t.integer :entity_id, null: false

      t.integer :presentation
      t.integer :sort_order, default: 0

      t.boolean :search_indexable, default: false

      t.timestamps null: false
    end
  end
end
