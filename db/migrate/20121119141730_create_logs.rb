class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :creator, :class_name => "User"
      t.timestamps
    end
    add_index :logs, :creator_id
  end
end
