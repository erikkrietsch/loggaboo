class Baby < ActiveRecord::Base
  attr_accessible :name, :birthday
  has_and_belongs_to_many :users
  has_and_belongs_to_many :logs
  has_one :owner, :class_name => "User", :foreign_key => "owner_id"
  
end
