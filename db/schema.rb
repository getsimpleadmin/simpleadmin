# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_15_153614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "project_menu_items", force: :cascade do |t|
    t.string "icon"
    t.string "locale"
    t.string "path"
    t.string "model_klass_name"
    t.string "slug"
    t.integer "project_id"
    t.integer "sort_order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "url_scheme"
    t.string "url_domain"
    t.string "slug"
    t.string "logo"
    t.string "encrypted_secret_key"
    t.string "page_title"
    t.string "favicon"
    t.integer "style", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "simple_admin_entities", force: :cascade do |t|
    t.string "model_klass_name", null: false
    t.string "label"
    t.bigint "project_id"
    t.string "icon"
    t.string "slug"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_simple_admin_entities_on_project_id"
  end

  create_table "simple_admin_entity_field_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "template", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_entity_fields", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.string "slug"
    t.integer "entity_field_type_id", null: false
    t.integer "entity_id", null: false
    t.integer "presentation"
    t.integer "sort_order", default: 1
    t.boolean "sorting", default: false
    t.boolean "search_indexable", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_user_role_abilities", force: :cascade do |t|
    t.string "resource_name"
    t.string "slug"
    t.integer "action_name"
    t.integer "user_role_id"
    t.integer "sort_order", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_user_roles", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "project_id"
    t.bigint "user_role_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_simple_admin_users_on_email", unique: true
    t.index ["project_id"], name: "index_simple_admin_users_on_project_id"
    t.index ["reset_password_token"], name: "index_simple_admin_users_on_reset_password_token", unique: true
    t.index ["user_role_id"], name: "index_simple_admin_users_on_user_role_id"
  end

  create_table "simple_admin_users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_simple_admin_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_simple_admin_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_simple_admin_users_roles_on_user_id"
  end

  create_table "simple_admin_widget_categories", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.string "template"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_widgets", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.string "slug"
    t.integer "width"
    t.bigint "project_id"
    t.bigint "widget_category_id"
    t.bigint "entity_id"
    t.boolean "status", default: true
    t.integer "sort_order", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_simple_admin_widgets_on_entity_id"
    t.index ["project_id"], name: "index_simple_admin_widgets_on_project_id"
    t.index ["widget_category_id"], name: "index_simple_admin_widgets_on_widget_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["project_id"], name: "index_users_on_project_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
