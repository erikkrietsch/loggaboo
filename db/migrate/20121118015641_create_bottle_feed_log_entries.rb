class CreateBottleFeedLogEntries < ActiveRecord::Migration
  def change
    create_table :bottle_feed_log_entries do |t|
      t.string "kind"
      t.decimal "amount"
      t.timestamps
    end
  end
end
