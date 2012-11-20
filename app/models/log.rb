class Log < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :babies #for twins, triplets, etc.?
  has_many :log_entries
  belongs_to :creator, :class_name => "User", :foreign_key => :created_by_user_id
end
