class DropMultipleLogsPerBaby < ActiveRecord::Migration
  def up
    drop_table :babies_logs
    add_column :babies, :log_id, :integer 
    add_index :babies, :log_id
  end
  
  def down
    create_table :babies_users, :id => false do |t|
      t.references :user
      t.references :baby
    end
    add_index :babies_users, ["user_id", "baby_id"]
  end
end
