class AddTokenIndex < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_index :users, :open_id_token, :unique => true
  end

  def down
    remove_index :users, :open_id_token
  end
end
