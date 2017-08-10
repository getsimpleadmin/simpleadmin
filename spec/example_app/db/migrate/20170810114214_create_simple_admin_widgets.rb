class CreateSimpleAdminWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_widgets do |t|
      t.string :name
      t.string :slug

      t.integer :widget_type_id

      t.timestamps null: false
    end
  end
end
