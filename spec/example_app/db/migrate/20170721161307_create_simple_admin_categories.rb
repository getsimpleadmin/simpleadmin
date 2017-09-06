class CreateSimpleAdminCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_categories do |t|
      t.string :title
      t.string :image

      t.string :slug

      t.timestamps null: false
    end
  end
end
