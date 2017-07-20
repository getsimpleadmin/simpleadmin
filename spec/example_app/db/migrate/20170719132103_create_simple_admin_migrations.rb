class CreateSimpleAdminMigrations < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_entities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
