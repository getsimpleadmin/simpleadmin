class CreateSimpleAdminPluginTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_plugin_types do |t|
      t.string :name
      t.string :status

      t.timestamps null: false
    end
  end
end
