class BottleFeedLogEntry < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :log_entry, :as => :loggable
end
