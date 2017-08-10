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

ActiveRecord::Schema.define(version: 20170810123740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "simple_admin_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_category_translations", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["category_id"], name: "index_69912e5010380b695944c6a92f5558b8d3b295b9"
    t.index ["locale"], name: "index_simple_admin_category_translations_on_locale"
  end

  create_table "simple_admin_entities", force: :cascade do |t|
    t.string "model_klass_name"
    t.string "model_plural_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_entity_field_translations", force: :cascade do |t|
    t.integer "entity_field_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.index ["entity_field_id"], name: "index_03e14c43aa90a80ec281839a01220fc72cfd886e"
    t.index ["locale"], name: "index_simple_admin_entity_field_translations_on_locale"
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
    t.integer "entity_field_type_id", null: false
    t.integer "entity_id", null: false
    t.integer "display"
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

  create_table "simple_admin_post_translations", force: :cascade do |t|
    t.integer "post_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
    t.index ["locale"], name: "index_simple_admin_post_translations_on_locale"
    t.index ["post_id"], name: "index_simple_admin_post_translations_on_simple_admin_post_id"
  end

  create_table "simple_admin_posts", force: :cascade do |t|
    t.string "image"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_setting_translations", force: :cascade do |t|
    t.integer "setting_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.index ["locale"], name: "index_simple_admin_setting_translations_on_locale"
    t.index ["setting_id"], name: "index_4595a94dac4f0729f9b4b64558d27f5b2cca99c5"
  end

  create_table "simple_admin_settings", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.string "presentation"
    t.integer "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_widget_feature_items", force: :cascade do |t|
    t.string "object_type"
    t.integer "object_id"
    t.integer "widget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_widget_translations", force: :cascade do |t|
    t.integer "widget_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.index ["locale"], name: "index_simple_admin_widget_translations_on_locale"
    t.index ["widget_id"], name: "index_104c1ff078fe6019fa12306c4fe20d8220c85f53"
  end

  create_table "simple_admin_widget_types", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_admin_widgets", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "widget_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
