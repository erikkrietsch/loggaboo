class LogEntry < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :log
  belongs_to :loggable, :polymorphic => true
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
end
