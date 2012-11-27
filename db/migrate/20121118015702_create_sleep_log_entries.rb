class CreateSleepLogEntries < ActiveRecord::Migration
  def self.up
    create_table :sleep_log_entries do |t|
      t.decimal "duration"
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sleep_log_entries
  end
end
