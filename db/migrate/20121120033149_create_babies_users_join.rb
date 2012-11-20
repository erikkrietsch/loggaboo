class CreateBabiesUsersJoin < ActiveRecord::Migration
  def up
    create_table :babies_users, :id => false do |t|
      t.references :user
      t.references :baby
    end
    add_index :babies_users, ["user_id", "baby_id"]
  end

  def down
    drop_table :babies_users
  end
end
