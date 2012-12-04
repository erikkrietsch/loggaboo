class ChangeDiaperType < ActiveRecord::Migration
  def change
    rename_column :diaper_log_entries, :type, :kind    
  end

end
