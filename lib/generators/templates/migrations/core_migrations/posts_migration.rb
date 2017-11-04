class CreateSimpleAdminPostsMigration < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_posts do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :tags

      t.integer :category_id
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
