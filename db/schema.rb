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

ActiveRecord::Schema.define(:version => 20121208003243) do

  create_table "babies", :force => true do |t|
    t.string   "name",       :null => false
    t.date     "birthday"
    t.string   "photo_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "owner_id",   :null => false
    t.integer  "log_id"
  end

  add_index "babies", ["log_id"], :name => "index_babies_on_log_id"
  add_index "babies", ["owner_id"], :name => "index_babies_on_owner_id"

  create_table "babies_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "baby_id"
  end

  add_index "babies_users", ["baby_id", "user_id"], :name => "index_babies_users_on_baby_id_and_user_id", :unique => true

  create_table "bottle_feed_log_entries", :force => true do |t|
    t.string   "kind"
    t.decimal  "amount",     :precision => 10, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "breast_feed_log_entries", :force => true do |t|
    t.string   "breast",     :limit => 5
    t.decimal  "duration",                :precision => 10, :scale => 0
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  create_table "diaper_log_entries", :force => true do |t|
    t.string   "kind"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "log_entries", :force => true do |t|
    t.integer  "log_id"
    t.integer  "creator_id"
    t.integer  "loggable_id"
    t.string   "loggable_type"
    t.datetime "when"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "log_entries", ["creator_id"], :name => "index_log_entries_on_creator_id"
  add_index "log_entries", ["log_id"], :name => "index_log_entries_on_log_id"
  add_index "log_entries", ["loggable_id"], :name => "index_log_entries_on_loggable_id"

  create_table "logs", :force => true do |t|
    t.integer  "creator_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "logs", ["creator_id"], :name => "index_logs_on_creator_id"

  create_table "medicine_log_entries", :force => true do |t|
    t.decimal  "amount",     :precision => 10, :scale => 0
    t.string   "amount_uom"
    t.string   "kind"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "other_log_entries", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sleep_log_entries", :force => true do |t|
    t.decimal  "duration",   :precision => 10, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "user_configs", :force => true do |t|
    t.integer  "user_id",                                              :null => false
    t.string   "time_zone",  :default => "Central Time (US & Canada)", :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "user_configs", ["user_id"], :name => "index_user_configs_on_user_id", :unique => true

  create_table "user_permission_requests", :force => true do |t|
    t.integer  "requested_by_id",                :null => false
    t.integer  "requested_of_id",                :null => false
    t.integer  "status",          :default => 0, :null => false
    t.datetime "status_changed",                 :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "token",                          :null => false
  end

  add_index "user_permission_requests", ["requested_by_id", "requested_of_id"], :name => "index_on_upr_requestor_id_and_requestee_id"
  add_index "user_permission_requests", ["token"], :name => "index_user_permission_requests_on_token"

  create_table "users", :force => true do |t|
    t.string   "auth_token"
    t.string   "email"
    t.string   "display_name"
    t.datetime "last_login"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "auth_provider"
  end

  add_index "users", ["auth_token", "auth_provider"], :name => "index_users_on_auth_token_and_auth_provider"
  add_index "users", ["auth_token"], :name => "index_users_on_open_id_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
