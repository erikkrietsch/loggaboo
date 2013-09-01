class AddUniqueConstraintOnBabiesUsers < ActiveRecord::Migration
  def up
    remove_index :babies_users, :name => :index_babies_users_on_user_id_and_baby_id
    add_index :babies_users, [:baby_id, :user_id], :unique => true
  end

  def down
    remove_index :babies_users, :name => :index_babies_users_on_baby_id_and_user_id
    add_index :babies_users, [:baby_id, :user_id]    
  end
end
