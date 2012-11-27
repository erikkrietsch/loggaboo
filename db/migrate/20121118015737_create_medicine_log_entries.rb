class CreateMedicineLogEntries < ActiveRecord::Migration
  def self.up
    create_table :medicine_log_entries do |t|
      t.decimal "amount"
      t.string "amount_uom"
      t.string "kind"
      t.timestamps
    end
  end
  
  def self.down
    drop_table :medicine_log_entries
  end
end
