class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name

      t.string :url_scheme
      t.string :url_domain

      t.string :slug
      t.string :logo

      t.string :encrypted_secret_key
      t.string :page_title

      t.string :favicon

      t.integer :style, default: 0

      t.references :user, index: true

      t.timestamps null: false
    end

    create_table :project_menu_items do |t|
      t.string :icon
      t.string :locale
      t.string :path
      t.string :model_klass_name

      t.string :slug

      t.integer :project_id
      t.integer :sort_order, default: 0

      t.timestamps null: false
    end
  end
end
