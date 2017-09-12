class CreateSimpleAdminRelatedItemsMigration < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_related_items do |t|
      t.string  :object_type
      t.integer :object_id

      t.string  :related_object_type
      t.integer :related_object_id

      t.timestamps null: false
    end
  end
end
