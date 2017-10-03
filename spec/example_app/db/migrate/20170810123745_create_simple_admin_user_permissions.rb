class CreateSimpleAdminUserPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :simple_admin_user_permissions do |t|
      t.string :action
      t.string :action_modificator

      t.string :model_klass_name

      t.integer :role_id, null: false

      t.timestamps null: false
    end
  end
end
