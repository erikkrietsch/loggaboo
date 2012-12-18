class LogEntriesController < ApplicationController
  include UsersHelper
  def new
    @log_entry = LogEntry.new(:log_id => params[:log_id], :creator_id => session[:user_id], :loggable_type => params[:type], :when => Time.now.to_s(:short))
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
    @types = %w[breastfeed bottlefeed sleep diaper medicine pump tummytime other]
  end
  
  def create
    @log_entry = LogEntry.new(params[:log_entry])
    Time.use_zone(current_user.config.time_zone) do
      @log_entry.when = Time.parse(@log_entry.when.utc.to_s(:long))
    end
    @log_entry.log = Log.find_by_id(params[:log_id])
    @log_entry.creator = User.find_by_auth_token(session[:uid])
    puts params.inspect
    case params[:type]
    when "breastfeed"
      @loggable = BreastFeedLogEntry.create(params[:breast_feed_log_entry])    
    when "bottlefeed"
      @loggable = BottleFeedLogEntry.create(params[:bottle_feed_log_entry])
    when "diaper"
      @loggable = DiaperLogEntry.create(params[:diaper_log_entry])
    when "medicine"
      @loggable = MedicineLogEntry.create(params[:medicine_log_entry])
    when "sleep"
      @loggable = SleepLogEntry.create(params[:sleep_log_entry])
    when "pump"
      @loggable = PumpLogEntry.create(params[:pump_log_entry])
    when "tummytime"
      @loggable = TummyTimeLogEntry.create(params[:tummy_time_log_entry])
    else
      @loggable = OtherLogEntry.create(params[:other_log_entry])
    end
    @log_entry.loggable = @loggable
    @log_entry.save
    redirect_to :controller => :logs, :action => :show, :id => @log_entry.log.id
  end
  
  def destroy
    @log_entry = LogEntry.find_by_id(params[:id])
    @log_entry.destroy if @log_entry.creator == current_user
    flash[:notice] = "Log entry deleted."
    redirect_to :controller => :logs, :action => :show, :id => @log_entry.log.id
  end
end
