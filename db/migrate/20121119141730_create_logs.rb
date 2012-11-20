class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.integer :created_by_user_id
      t.timestamps
    end
    add_index("logs", "created_by_user_id")
  end
  
  def self.down
    drop_table :logs
  end
end
