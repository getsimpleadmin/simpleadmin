class CreateSimpleAdminCoreMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_admin_entities do |t|
      t.string :model_klass_name, null: false
      t.string :label

      t.references :project

      t.string :icon
      t.string :slug

      t.boolean :status, default: true

      t.timestamps null: false
    end

    create_table :simple_admin_entity_fields do |t|
      t.string :name
      t.string :label
      t.string :slug

      t.integer :entity_field_type_id, null: false
      t.integer :entity_id, null: false

      t.integer :presentation
      t.integer :sort_order, default: 1

      t.boolean :sorting, default: false
      t.boolean :search_indexable, default: false

      t.timestamps null: false
    end

    create_table :simple_admin_entity_field_types do |t|
      t.string :name,     null: false
      t.string :template, null: false

      t.timestamps null: false
    end

    create_table :simple_admin_widgets do |t|
      t.string :name
      t.string :icon
      t.string :slug

      t.integer :width

      t.references :project
      t.references :widget_category
      t.references :entity

      t.boolean :status, default: true

      t.integer :sort_order, default: 1

      t.timestamps null: false
    end

    create_table :simple_admin_widget_categories do |t|
      t.string :name
      t.string :label
      t.string :template

      t.timestamps null: false
    end
  end
end
