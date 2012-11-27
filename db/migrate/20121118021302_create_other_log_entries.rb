class CreateOtherLogEntries < ActiveRecord::Migration
  def self.up
    create_table :other_log_entries do |t|
      t.timestamps
    end
  end
  
  def self.down
    drop_table :other_log_entries
  end
end
