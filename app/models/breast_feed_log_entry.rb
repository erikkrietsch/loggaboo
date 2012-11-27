class BreastFeedLogEntry < ActiveRecord::Base
  attr_accessible :breast, :duration
  has_one :log_entry, :as => :loggable
end
