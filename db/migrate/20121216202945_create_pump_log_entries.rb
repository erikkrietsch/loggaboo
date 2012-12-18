class CreatePumpLogEntries < ActiveRecord::Migration
  def change
    create_table :pump_log_entries do |t|
      t.decimal "duration", :default => 0.0
      t.integer "amount", :default => 0
      t.string "amount_uom", :default => "mL"
      t.timestamps
    end
  end
end
