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

ActiveRecord::Schema.define(version: 20170726011923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_category_relations", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.string   "publication_year"
    t.decimal  "price",              precision: 5, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "country_of_origin"
    t.text     "description"
    t.boolean  "published",                                  default: true
    t.decimal  "discount",           precision: 5, scale: 2
    t.boolean  "first_page",                                 default: false
    t.boolean  "new_book",                                   default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "ruc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dv"
  end

  create_table "contact_forms", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "profession"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotation_items", force: :cascade do |t|
    t.integer  "quotation_id"
    t.integer  "book_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.decimal  "unit_price",   precision: 12, scale: 3
    t.decimal  "total_price",  precision: 12, scale: 3
    t.integer  "quantity"
  end

  add_index "quotation_items", ["book_id"], name: "index_quotation_items_on_book_id", using: :btree
  add_index "quotation_items", ["quotation_id"], name: "index_quotation_items_on_quotation_id", using: :btree

  create_table "quotation_steps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.decimal  "subtotal"
    t.decimal  "tax",              precision: 12, scale: 2
    t.decimal  "shipping",         precision: 12, scale: 2
    t.decimal  "total",            precision: 12, scale: 2
    t.decimal  "quotation_status"
    t.integer  "user_id"
    t.integer  "client_id"
    t.date     "date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "full_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "quotation_items", "books"
  add_foreign_key "quotation_items", "quotations"
end
