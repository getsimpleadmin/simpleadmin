class CreateSimpleAdminSetting < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_settings do |t|
      t.string :name
      t.string :value

      t.string :label

      t.timestamps null: false
    end
  end
end
