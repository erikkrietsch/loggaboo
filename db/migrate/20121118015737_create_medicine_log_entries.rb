class CreateMedicineLogEntries < ActiveRecord::Migration
  def self.up
    create_table :medicine_log_entries do |t|
      t.integer "baby_id"
      t.integer "user_id"
      t.integer "log_entry_id"
      t.text "notes"
      t.datetime "when"
      t.decimal "amount"
      t.string "amount_uom"
      t.string "kind"
      t.timestamps
    end
    add_index("medicine_log_entries", "baby_id")
    add_index("medicine_log_entries", "user_id")
    add_index("medicine_log_entries", "log_entry_id")
  end
  
  def self.down
    drop_table :medicine_log_entries
  end
end
