class CreateDiaperLogEntries < ActiveRecord::Migration
  def self.up
    create_table :diaper_log_entries do |t|
      t.string "type"
      t.timestamps
    end
  end
  
  def self.down
    drop_table :diaper_log_entries
  end
end
