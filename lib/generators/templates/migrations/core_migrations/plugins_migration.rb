class CreateSimpleAdminPluginsMigration < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_plugins do |t|
      t.string :name
      t.string :label

      t.integer :plugin_type_id

      t.timestamps null: false
    end
  end
end
