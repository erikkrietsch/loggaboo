class PumpLogEntry < ActiveRecord::Base
  attr_accessible :amount, :amount_uom, :duration
  has_one :log_entry, :as => :loggable
end
