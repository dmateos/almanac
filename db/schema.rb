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

ActiveRecord::Schema.define(version: 20160528103043) do

  create_table "contacts", force: :cascade do |t|
    t.integer  "organisation_id", limit: 4
    t.string   "c_type",          limit: 255
    t.string   "c_value",         limit: 255
    t.string   "comment",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "contacts", ["organisation_id"], name: "index_contacts_on_organisation_id", using: :btree

  create_table "councils", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "cu_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "datasets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "dataset_id", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "organisation_subjects", force: :cascade do |t|
    t.integer  "organisation_id", limit: 4
    t.integer  "subject_id",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "organisation_subjects", ["organisation_id"], name: "index_organisation_subjects_on_organisation_id", using: :btree
  add_index "organisation_subjects", ["subject_id"], name: "index_organisation_subjects_on_subject_id", using: :btree

  create_table "organisations", force: :cascade do |t|
    t.string   "name",              limit: 255,   null: false
    t.string   "aka",               limit: 255
    t.string   "acronym",           limit: 255
    t.string   "former_name",       limit: 255
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
    t.string   "accreditation",     limit: 255
    t.integer  "dataset_id",        limit: 4
    t.string   "website",           limit: 255
    t.string   "street_address",    limit: 255
    t.integer  "street_postcode",   limit: 4
    t.string   "street_suburb",     limit: 255
    t.integer  "street_state_id",   limit: 4
    t.string   "post_address",      limit: 255
    t.integer  "post_postcode",     limit: 4
    t.string   "post_suburb",       limit: 255
    t.integer  "post_state_id",     limit: 4
    t.text     "services",          limit: 65535
    t.text     "eligibility",       limit: 65535
    t.text     "comment",           limit: 65535
    t.text     "hours",             limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subject_links", force: :cascade do |t|
    t.integer "parent_id", limit: 4
    t.integer "child_id",  limit: 4
  end

  add_index "subject_links", ["child_id"], name: "index_subject_links_on_child_id", using: :btree
  add_index "subject_links", ["parent_id"], name: "index_subject_links_on_parent_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "position",        limit: 255
    t.string   "phone",           limit: 255
    t.string   "mobile",          limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "contacts", "organisations"
  add_foreign_key "organisation_subjects", "organisations"
  add_foreign_key "organisation_subjects", "subjects"
end
