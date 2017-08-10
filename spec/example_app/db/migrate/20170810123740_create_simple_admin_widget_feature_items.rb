class CreateSimpleAdminWidgetFeatureItems < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_widget_feature_items do |t|
      t.string  :object_type
      t.integer :object_id

      t.integer :widget_id

      t.timestamps null: false
    end
  end
end
