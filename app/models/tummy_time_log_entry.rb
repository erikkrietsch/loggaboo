class TummyTimeLogEntry < ActiveRecord::Base
  attr_accessible :duration
  has_one :log_entry, :as => :loggable
end
