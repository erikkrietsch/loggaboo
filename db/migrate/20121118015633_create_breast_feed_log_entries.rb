class CreateBreastFeedLogEntries < ActiveRecord::Migration
  def self.up
    create_table :breast_feed_log_entries do |t|
      t.string "breast", :limit => 5
      t.decimal "duration"
      t.timestamps
    end
  end
  
  def self.down
    drop_table :breast_feed_log_entries
  end
end
