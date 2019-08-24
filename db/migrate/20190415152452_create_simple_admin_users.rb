class CreateSimpleAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_admin_users do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.references :project
      t.references :user_role

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
    end

    add_index :simple_admin_users, :email,                unique: true
    add_index :simple_admin_users, :reset_password_token, unique: true
  end
end
