class CreateSimpleAdminMigrations < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_pages do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :simple_admin_widgets do |t|
      t.string :name

      t.integer :page_id
      t.integer :sort_order

      t.json :data

      t.timestamps null: false
    end
  end
end
