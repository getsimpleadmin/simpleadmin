class CreateSimpleAdminLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_admin_languages do |t|
      t.string :name
      t.string :code

      t.boolean :status

      t.timestamps null: false
    end
  end
end
