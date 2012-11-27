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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121122014110) do

  create_table "babies", :force => true do |t|
    t.string   "name",       :null => false
    t.date     "birthday"
    t.string   "photo_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "babies_logs", :id => false, :force => true do |t|
    t.integer "baby_id"
    t.integer "log_id"
  end

  add_index "babies_logs", ["baby_id", "log_id"], :name => "index_babies_logs_on_baby_id_and_log_id"

  create_table "babies_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "baby_id"
  end

  add_index "babies_users", ["user_id", "baby_id"], :name => "index_babies_users_on_user_id_and_baby_id"

  create_table "bottle_feed_log_entries", :force => true do |t|
    t.integer  "baby_id"
    t.integer  "user_id"
    t.integer  "log_entry_id"
    t.text     "notes"
    t.datetime "when"
    t.string   "kind"
    t.decimal  "amount",       :precision => 10, :scale => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "bottle_feed_log_entries", ["baby_id"], :name => "index_bottle_feed_log_entries_on_baby_id"
  add_index "bottle_feed_log_entries", ["log_entry_id"], :name => "index_bottle_feed_log_entries_on_log_entry_id"
  add_index "bottle_feed_log_entries", ["user_id"], :name => "index_bottle_feed_log_entries_on_user_id"

  create_table "breast_feed_log_entries", :force => true do |t|
    t.integer  "baby_id"
    t.integer  "user_id"
    t.integer  "log_entry_id"
    t.text     "notes"
    t.string   "breast",       :limit => 5
    t.datetime "when"
    t.decimal  "duration",                  :precision => 10, :scale => 0
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "breast_feed_log_entries", ["baby_id"], :name => "index_breast_feed_log_entries_on_baby_id"
  add_index "breast_feed_log_entries", ["log_entry_id"], :name => "index_breast_feed_log_entries_on_log_entry_id"
  add_index "breast_feed_log_entries", ["user_id"], :name => "index_breast_feed_log_entries_on_user_id"

  create_table "diaper_log_entries", :force => true do |t|
    t.integer  "baby_id"
    t.integer  "user_id"
    t.integer  "log_entry_id"
    t.text     "notes"
    t.datetime "when"
    t.string   "type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "diaper_log_entries", ["baby_id"], :name => "index_diaper_log_entries_on_baby_id"
  add_index "diaper_log_entries", ["log_entry_id"], :name => "index_diaper_log_entries_on_log_entry_id"
  add_index "diaper_log_entries", ["user_id"], :name => "index_diaper_log_entries_on_user_id"

  create_table "log_entries", :force => true do |t|
    t.integer  "log_id"
    t.integer  "loggable_id"
    t.string   "loggable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "log_entries", ["log_id"], :name => "index_log_entries_on_log_id"
  add_index "log_entries", ["loggable_id"], :name => "index_log_entries_on_loggable_id"

  create_table "logs", :force => true do |t|
    t.integer  "created_by_user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "logs", ["created_by_user_id"], :name => "index_logs_on_created_by_user_id"

  create_table "medicine_log_entries", :force => true do |t|
    t.integer  "baby_id"
    t.integer  "user_id"
    t.integer  "log_entry_id"
    t.text     "notes"
    t.datetime "when"
    t.decimal  "amount",       :precision => 10, :scale => 0
    t.string   "amount_uom"
    t.string   "kind"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "medicine_log_entries", ["baby_id"], :name => "index_medicine_log_entries_on_baby_id"
  add_index "medicine_log_entries", ["log_entry_id"], :name => "index_medicine_log_entries_on_log_entry_id"
  add_index "medicine_log_entries", ["user_id"], :name => "index_medicine_log_entries_on_user_id"

  create_table "other_log_entries", :force => true do |t|
    t.integer  "baby_id"
    t.integer  "user_id"
    t.integer  "log_entry_id"
    t.text     "notes"
    t.datetime "when"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "other_log_entries", ["baby_id"], :name => "index_other_log_entries_on_baby_id"
  add_index "other_log_entries", ["log_entry_id"], :name => "index_other_log_entries_on_log_entry_id"
  add_index "other_log_entries", ["user_id"], :name => "index_other_log_entries_on_user_id"

  create_table "sleep_log_entries", :force => true do |t|
    t.integer  "baby_id"
    t.integer  "user_id"
    t.integer  "log_entry_id"
    t.text     "notes"
    t.datetime "when"
    t.decimal  "duration",     :precision => 10, :scale => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "sleep_log_entries", ["baby_id"], :name => "index_sleep_log_entries_on_baby_id"
  add_index "sleep_log_entries", ["log_entry_id"], :name => "index_sleep_log_entries_on_log_entry_id"
  add_index "sleep_log_entries", ["user_id"], :name => "index_sleep_log_entries_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "open_id_token"
    t.string   "email"
    t.string   "display_name"
    t.datetime "last_login"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["open_id_token"], :name => "index_users_on_open_id_token", :unique => true

end
