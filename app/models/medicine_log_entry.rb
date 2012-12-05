class MedicineLogEntry < ActiveRecord::Base
  attr_accessible :kind, :amount, :amount_uom
  has_one :log_entry, :as => :loggable
end
