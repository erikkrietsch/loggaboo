class LogEntriesController < ApplicationController
  
  def new
    @log_entry = LogEntry.new(:log_id => params[:log_id], :creator_id => session[:user_id], :loggable_type => params[:type], :when => DateTime.now.to_s(:short))
    case params[:type]
    when "breastfeed"
      @loggable = BreastFeedLogEntry.new    
    when "bottlefeed"
      @loggable = BottleFeedLogEntry.new
    when "diaper"
      @loggable = DiaperLogEntry.new
    when "medicine"
      @loggable = MedicineLogEntry.new
    when "sleep"
      @loggable = SleepLogEntry.new
    else
      @loggable = OtherLogEntry.new
    end 
    
  end
  
  def new_menu
    @log = Log.find_by_id(params[:log_id])
    @types = ["breastfeed", "sleep", "diaper", "medicine"]
  end
  
  def create
    @log_entry = LogEntry.create(params[:log_entry])
    @log_entry.log = Log.find_by_id(params[:log_id])
    @log_entry.creator = User.find_by_auth_token(session[:uid])
    case params[:type]
    when "breastfeed"
      @loggable = BreastFeedLogEntry.create(params[:breast_feed_log_entry])    
    when "bottlefeed"
      @loggable = BottleFeedLogEntry.new
    when "diaper"
      @loggable = DiaperLogEntry.new
    when "medicine"
      @loggable = MedicineLogEntry.new
    when "sleep"
      @loggable = SleepLogEntry.new
    else
      @loggable = OtherLogEntry.new
    end
    @log_entry.loggable = @loggable
    @log_entry.save
    redirect_to :controller => :logs, :action => :show, :id => @log_entry.log.id
  end
end
