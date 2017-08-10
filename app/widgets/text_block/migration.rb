class CreateSimpleAdminWidgetTextBlockMigrations < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_widget_text_blocks do |t|
      t.string :value
      t.string :image

      t.integer :page_id

      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
