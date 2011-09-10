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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110909091804) do

  create_table "national_patient_identifiers", :force => true do |t|
    t.string   "value"
    t.string   "person_id"
    t.datetime "assigned_at"
    t.integer  "assigner_id"
    t.integer  "assigner_site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version_number",  :default => 0
    t.string   "creator_id"
    t.string   "creator_site_id"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "annotations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_hash"
    t.string   "site"
    t.string   "email"
    t.string   "description"
    t.boolean  "disabled",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
