class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.references :log
      t.references :loggable, :polymorphic => true
      t.timestamps
    end
    add_index("log_entries", "loggable_id")
    add_index("log_entries", "log_id")
  end
end
