class CreateUserConfigs < ActiveRecord::Migration
  def change
    create_table :user_configs do |t|
      t.references :user, :null => false
      t.string :time_zone, :null => false, :default => "Central Time (US & Canada)"
      t.timestamps
    end
    add_index :user_configs, :user_id, :unique => true
  end
end
