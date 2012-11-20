class DiaperLogEntry < ActiveRecord::Base
  attr_accessible :notes, :when, :type
  has_one :log_entry, :as => :loggable
end
