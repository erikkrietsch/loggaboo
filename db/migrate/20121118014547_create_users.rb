class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "open_id_token"
      t.string "email"
      t.string "display_name"
      t.datetime "last_login"
      t.timestamps
    end
  end
end
