class CreateSimpleAdminWidgetTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_widget_types do |t|
      t.string :name
      t.string :slug

      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
