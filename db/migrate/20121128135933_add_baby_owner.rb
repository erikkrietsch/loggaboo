class AddBabyOwner < ActiveRecord::Migration
  def up
    change_table :babies do |t|
      t.references :owner, :null => false
    end

    add_index :babies, :owner_id
  end

  def down
    remove_index :babies, :owner_id
    remove_column :babies, :owner_id
  end
end
