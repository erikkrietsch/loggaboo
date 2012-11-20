class LogEntry < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :loggable, :polymorphic => true
  belongs_to :log
end
