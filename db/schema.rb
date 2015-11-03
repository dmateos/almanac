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

ActiveRecord::Schema.define(version: 20151103111843) do

  create_table "organisations", force: :cascade do |t|
    t.string   "name",              limit: 255, null: false
    t.string   "aka",               limit: 255
    t.string   "acronym",           limit: 255
    t.string   "former_name",       limit: 255
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
    t.string   "accreditation",     limit: 255
    t.string   "street_address",    limit: 255
    t.integer  "street_postcode",   limit: 4
    t.string   "street_suburb",     limit: 255
    t.string   "street_state",      limit: 255
    t.string   "post_address",      limit: 255
    t.integer  "post_postcode",     limit: 4
    t.string   "post_suburb",       limit: 255
    t.string   "post_state",        limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "organisation_id", limit: 4
    t.integer  "tag_id",          limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "taggings", ["organisation_id"], name: "index_taggings_on_organisation_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "taggings", "organisations"
  add_foreign_key "taggings", "tags"
end
