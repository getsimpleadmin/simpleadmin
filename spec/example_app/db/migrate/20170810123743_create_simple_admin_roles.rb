class CreateSimpleAdminRoles < ActiveRecord::Migration[5.1]
  def change
    create_table(:simple_admin_roles) do |t|
      t.string :name
      t.references :resource, polymorphic: true

      t.timestamps
    end

    create_table(:simple_admin_users_simple_admin_roles, id: false) do |t|
      t.references :user
      t.references :role
    end
  end
end
