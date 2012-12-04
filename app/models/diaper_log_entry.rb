class DiaperLogEntry < ActiveRecord::Base
  attr_accessible :kind
  has_one :log_entry, :as => :loggable
end
