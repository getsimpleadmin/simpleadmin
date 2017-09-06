class CreateSimpleAdminLayouts < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_layouts do |t|
      t.string :name
      t.string :path

      t.string :slug

      t.timestamps null: false
    end

    add_index :simple_admin_layouts, :slug, unique: true
  end
end
