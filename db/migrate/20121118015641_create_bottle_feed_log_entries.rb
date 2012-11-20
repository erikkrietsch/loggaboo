class CreateBottleFeedLogEntries < ActiveRecord::Migration
  def change
    create_table :bottle_feed_log_entries do |t|
      t.integer "baby_id"
      t.integer "user_id"
      t.integer "log_entry_id"
      t.text "notes"
      t.datetime "when"
      t.string "kind"
      t.decimal "amount"
      t.timestamps
    end
    add_index("bottle_feed_log_entries", "baby_id")
    add_index("bottle_feed_log_entries", "user_id")
    add_index("bottle_feed_log_entries", "log_entry_id")
  end
end
