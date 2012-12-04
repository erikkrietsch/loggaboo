class BreastFeedLogEntry < ActiveRecord::Base
  attr_accessible :breast, :duration, :log_entry_id
  has_one :log_entry, :as => :loggable
end
