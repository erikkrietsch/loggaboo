class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.references :log
      t.references :creator, :class_name => "User"
      t.references :loggable, :polymorphic => true
      t.datetime :when
      t.text :notes
      t.timestamps
    end
    add_index(:log_entries, :loggable_id)
    add_index(:log_entries, :log_id)
    add_index(:log_entries, :creator_id)
  end
end
