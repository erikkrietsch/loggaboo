class CreateTummyTimeLogEntries < ActiveRecord::Migration
  def change
    create_table :tummy_time_log_entries do |t|
      t.decimal "duration", :default => 0.0
      t.timestamps
    end
  end
end
