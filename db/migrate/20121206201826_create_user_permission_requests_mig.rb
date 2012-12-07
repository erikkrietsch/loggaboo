class CreateUserPermissionRequests < ActiveRecord::Migration
  def change
    create_table :user_permission_requests do |t|
      t.references :requested_by, :class => "User", :null => false
      t.references :requested_of, :class => "User", :null => false
      t.integer :status, :null => false, :default => 0 #0 = requested, 1 = approved, 2 = denied
      t.datetime :status_changed, :null => false
      t.timestamps
    end
    add_index :user_permission_requests, [:requested_by_id, :requested_of_id], :name => "index_on_upr_requestor_id_and_requestee_id"
  end
end
