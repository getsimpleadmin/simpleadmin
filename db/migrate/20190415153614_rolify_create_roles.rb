class RolifyCreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, polymorphic: true

      t.timestamps
    end

    create_table(:simple_admin_users_roles, id: false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:roles, %i[name resource_type resource_id])
    add_index(:simple_admin_users_roles, %i[user_id role_id])
  end
end
