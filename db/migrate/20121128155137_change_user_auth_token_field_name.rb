class ChangeUserAuthTokenFieldName < ActiveRecord::Migration
  def change
    rename_column :users, :open_id_token, :auth_token
    add_column :users, :auth_provider, :string
    add_index :users, [:auth_token, :auth_provider]
  end
end
