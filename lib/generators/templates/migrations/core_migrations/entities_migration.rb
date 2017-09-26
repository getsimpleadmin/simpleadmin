class CreateSimpleAdminEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_entities do |t|
      t.string :model_klass_name, null: false
      t.string :model_plural_name

      t.string :label

      t.boolean :status, default: true
      t.boolean :inbuilt, default: false

      t.timestamps null: false
    end
  end
end
