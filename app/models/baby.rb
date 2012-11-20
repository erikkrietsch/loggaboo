class Baby < ActiveRecord::Base
  attr_accessible :name, :birthday
  has_and_belongs_to_many :users
  has_and_belongs_to_many :logs
  
end
