class CreateBreastFeedLogEntries < ActiveRecord::Migration
  def self.up
    create_table :breast_feed_log_entries do |t|
      t.integer "baby_id"
      t.integer "user_id"
      t.integer "log_entry_id"
      t.text "notes"
      t.string "breast", :limit => 5
      t.datetime "when"
      t.decimal "duration"
      t.timestamps
    end
    add_index("breast_feed_log_entries", "baby_id")
    add_index("breast_feed_log_entries", "user_id")
    add_index("breast_feed_log_entries", "log_entry_id")
  end
  
  def self.down
    drop_table :breast_feed_log_entries
  end
end
