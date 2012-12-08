class UserConfig < ActiveRecord::Base
  attr_accessible :user_id, :time_zone
  belongs_to :user
end
