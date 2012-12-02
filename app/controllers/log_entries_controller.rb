class LogEntriesController < ApplicationController
  
  def new
    @log_entry = LogEntry.new
    @log_entry.creator = User.find_by_auth_token(session[:uid])
    @log_entry.log = Log.find_by_id(params[:log_id])
    @log_entry.when = DateTime.now
    
  end
  
  def create
    @log_entry = LogEntry.create(params[:log_entry])
    @log_entry.log = Log.find_by_id(params[:log_id])
    @log_entry.creator = User.find_by_auth_token(session[:uid])
    redirect_to :controller => :logs, :action => :show, :id => @log_entry.log.id
  end
end
