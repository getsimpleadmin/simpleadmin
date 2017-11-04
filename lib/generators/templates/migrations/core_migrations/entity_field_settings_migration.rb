class CreateSimpleAdminEntityFieldSettingsMigration < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_entity_field_settings do |t|
      t.string :name
      t.string :value

      t.integer :entity_field_id, null: false

      t.timestamps null: false
    end
  end
end
