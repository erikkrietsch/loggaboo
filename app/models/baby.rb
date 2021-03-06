class Baby < ActiveRecord::Base
  attr_accessible :name, :birthday, :owner
  has_and_belongs_to_many :users
  belongs_to :log
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  
end
