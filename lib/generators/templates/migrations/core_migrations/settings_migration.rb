class CreateSimpleAdminSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :simple_admin_settings do |t|
      t.string :name
      t.string :label

      t.string :value

      t.timestamps null: false
    end
  end
end
