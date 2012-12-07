class CreateUserPermissionRequests < ActiveRecord::Migration
  def change
    add_column :user_permission_requests, :token, :string, {:null => false}
    #add_column :user_permission_requests, :baby_id, :integer
    add_index :user_permission_requests, :token
    #add_index :user_permission_requests, :baby_id
  end
end
