class CreateSimpleAdminComments < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_comments do |t|
      t.string :message

      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps null: false
    end
  end
end
