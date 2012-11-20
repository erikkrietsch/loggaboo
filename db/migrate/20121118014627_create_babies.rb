class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string "name", :null => false
      t.date "birthday"
      t.string "photo_url"
      t.timestamps
    end
  end
end
