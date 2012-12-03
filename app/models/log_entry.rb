class LogEntry < ActiveRecord::Base
  attr_accessible :notes, :when, :creator_id, :log_id, :loggable_type, :loggable_id
  belongs_to :log
  belongs_to :loggable, :polymorphic => true
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  
  def type
    case self.loggable_type
    when "SleepLogEntry"
      result = "sleep"
    when "BreastFeedLogEntry"
      result = "breastfeed"
    when "BottleFeedLogEntry"
      result = "bottlefeed"
    when "MedicineLogEntry"
      result = "medicine"
    when "DiaperLogEntry"
      result = "diaper"
    else
      result = "other"
    end
    return result
  end
end
