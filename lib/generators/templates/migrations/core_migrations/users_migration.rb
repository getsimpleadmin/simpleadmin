class CreateSimpleAdminUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :simple_admin_users do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.timestamps null: false
    end
  end
end
