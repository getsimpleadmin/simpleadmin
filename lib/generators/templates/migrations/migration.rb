module Migrations
  def change
    create_table :simple_admin_users do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps null: false
    end

    create_table :simple_admin_pages do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :simple_admin_widgets do |t|
      t.string :name
      t.string :slug

      t.boolean :status, default: false

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
      t.string :model_klass_name
      t.string :model_plural_name

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

    create_table :simple_admin_settings do |t|
      t.string :name
      t.string :value

      t.string :label
      t.string :presentation

      t.integer :sort_order

      t.timestamps null: false
    end

    create_table :friendly_id_slugs do |t|
      t.string   :slug,           null: false
      t.integer  :sluggable_id,   null: false
      t.string   :sluggable_type, limit: 50
      t.string   :scope
      t.datetime :created_at
    end

    add_index :friendly_id_slugs, :sluggable_id
    add_index :friendly_id_slugs, [:slug, :sluggable_type]
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], unique: true
    add_index :friendly_id_slugs, :sluggable_type

    add_index :simple_admin_users, :reset_password_token, unique: true
  end
end

if Rails::VERSION::STRING.to_i < 5
  CreateSimpleAdminMigrations = Class.new(ActiveRecord::Migration) do
    include Migrations
  end
else
  CreateSimpleAdminMigrations = Class.new(ActiveRecord::Migration[5.1]) do
    include Migrations
  end
end
