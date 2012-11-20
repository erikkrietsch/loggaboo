class CreateSleepLogEntries < ActiveRecord::Migration
  def self.up
    create_table :sleep_log_entries do |t|
      t.integer "user_id"
      t.text "notes"
      t.datetime "when"
      t.decimal "duration"
      t.timestamps
    end
    add_index("sleep_log_entries", "user_id")
  end
  
  def self.down
    drop_table :sleep_log_entries
  end
end
