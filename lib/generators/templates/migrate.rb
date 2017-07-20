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

    create_table :simple_admin_posts do |t|
      t.string :image
      t.integer :category_id, null: false

      t.timestamps null: false
    end

    create_table :simple_admin_categories do |t|
      t.timestamps null: false
    end

    create_table :simple_admin_entities do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :simple_admin_entity_fields do |t|
      t.string :name

      t.integer :entity_field_type_id, null: false
      t.integer :entity_id, null: false

      t.integer :display

      t.timestamps null: false
    end

    create_table :simple_admin_entity_field_types do |t|
      t.string :name
      t.string :template

      t.boolean :inbuilt, default: false

      t.timestamps null: false
    end

    create_table :simple_admin_entity_field_settings do |t|
      t.json :data
      t.integer :entity_field_id

      t.timestamps null: false
    end

    create_table :simple_admin_languages do |t|
      t.string :name
      t.string :code

      t.boolean :status

      t.timestamps null: false
    end
  end
end
