class SleepLogEntry < ActiveRecord::Base
  attr_accessible :notes, :when, :duration
  has_one :log_entry, :as => :loggable
end
