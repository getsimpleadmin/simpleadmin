class CreateSimpleAdminPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_posts do |t|
      t.string :image

      t.integer :category_id, null: false

      t.timestamps null: false
    end
  end
end
