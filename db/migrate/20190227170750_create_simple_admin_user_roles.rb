class CreateSimpleAdminUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_admin_user_roles do |t|
      t.string :name
      t.string :slug

      t.integer :project_id

      t.timestamps null: false
    end

    create_table :simple_admin_user_role_abilities do |t|
      t.string :resource_name
      t.string :slug

      t.integer :action_name
      t.integer :user_role_id

      t.integer :sort_order, default: 1

      t.timestamps null: false
    end
  end
end
