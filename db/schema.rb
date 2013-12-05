# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131116203835) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id", using: :btree

  create_table "collection_fields", force: true do |t|
    t.integer  "poster_id"
    t.string   "element"
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collection_fields", ["field_id"], name: "index_collection_fields_on_field_id", using: :btree
  add_index "collection_fields", ["poster_id"], name: "index_collection_fields_on_poster_id", using: :btree

  create_table "collections", force: true do |t|
    t.text     "array"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "date_fields", force: true do |t|
    t.date     "date"
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_id"
  end

  add_index "date_fields", ["field_id"], name: "index_date_fields_on_field_id", using: :btree
  add_index "date_fields", ["poster_id"], name: "index_date_fields_on_poster_id", using: :btree

  create_table "fields", force: true do |t|
    t.string   "kind"
    t.integer  "category_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "collection_id"
  end

  add_index "fields", ["collection_id"], name: "index_fields_on_collection_id", using: :btree

  create_table "float_fields", force: true do |t|
    t.float    "float_number"
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_id"
  end

  add_index "float_fields", ["field_id"], name: "index_float_fields_on_field_id", using: :btree
  add_index "float_fields", ["poster_id"], name: "index_float_fields_on_poster_id", using: :btree

  create_table "integer_fields", force: true do |t|
    t.integer  "integer_number"
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_id"
  end

  add_index "integer_fields", ["field_id"], name: "index_integer_fields_on_field_id", using: :btree
  add_index "integer_fields", ["poster_id"], name: "index_integer_fields_on_poster_id", using: :btree

  create_table "posters", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "range_id"
    t.string   "range_type"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "posters", ["user_id"], name: "index_posters_on_user_id", using: :btree

  create_table "provinces", force: true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id", using: :btree

  create_table "string_fields", force: true do |t|
    t.string   "detail"
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_id"
  end

  add_index "string_fields", ["field_id"], name: "index_string_fields_on_field_id", using: :btree
  add_index "string_fields", ["poster_id"], name: "index_string_fields_on_poster_id", using: :btree

  create_table "text_fields", force: true do |t|
    t.text     "description"
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_id"
  end

  add_index "text_fields", ["field_id"], name: "index_text_fields_on_field_id", using: :btree
  add_index "text_fields", ["poster_id"], name: "index_text_fields_on_poster_id", using: :btree

  create_table "towns", force: true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "towns", ["state_id"], name: "index_towns_on_state_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
