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

ActiveRecord::Schema.define(version: 20170905132930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "simple_admin_categories", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_entities", force: :cascade do |t|
    t.string "model_klass_name", null: false
    t.string "model_plural_name"
    t.string "label"
    t.boolean "status", default: true
    t.boolean "inbuilt", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_entity_field_types", force: :cascade do |t|
    t.string "name"
    t.string "template"
    t.boolean "inbuilt", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_entity_fields", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.integer "entity_field_type_id", null: false
    t.integer "entity_id", null: false
    t.integer "presentation"
    t.integer "sort_order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_languages", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_layout_plugins", force: :cascade do |t|
    t.integer "layout_id", null: false
    t.integer "plugin_id", null: false
    t.integer "sort_order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_layouts", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_simple_admin_layouts_on_slug", unique: true
  end

  create_table "simple_admin_plugin_types", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image"
    t.string "tags"
    t.integer "category_id"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.string "twitter_nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type", "resource_id"], name: "index_simple_admin_roles_on_resource_type_and_resource_id"
  end

  create_table "simple_admin_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.string "presentation"
    t.integer "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_users_simple_admin_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_simple_admin_users_simple_admin_roles_on_role_id"
    t.index ["user_id"], name: "index_simple_admin_users_simple_admin_roles_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

end
