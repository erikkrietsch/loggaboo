class CreateBabiesLogsJoin < ActiveRecord::Migration
  def up
    create_table :babies_logs, :id => false do |t|
      t.references :baby
      t.references :log
    end
    add_index :babies_logs, ["baby_id", "log_id"]
  end

  def down
    drop_table :babies_logs
  end
end
