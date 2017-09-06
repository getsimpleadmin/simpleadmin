class CreateSimpleAdminLayoutPluginsMigration < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_layout_plugins do |t|
      t.integer :layout_id, null: false
      t.integer :plugin_id, null: false

      t.integer :sort_order, default: 0

      t.timestamps null: false
    end
  end
end
