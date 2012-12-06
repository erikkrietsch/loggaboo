class BottleFeedLogEntry < ActiveRecord::Base
  attr_accessible :kind, :amount
  has_one :log_entry, :as => :loggable
end
