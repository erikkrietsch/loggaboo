class DropMultipleLogsPerBaby < ActiveRecord::Migration
  def up
    drop_table :babies_logs
    add_column :babies, :log_id, :integer 
    add_index :babies, :log_id
  end
  
  def down
    create_table :babies_logs, :id => false do |t|
      t.references :baby
      t.references :log
    end
    add_index :babies_logs, ["baby_id", "log_id"]
  end
end
