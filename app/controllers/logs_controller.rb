class LogsController < ApplicationController
  before_filter :authenticate
  
  def show
    @log = Log.find_by_id(params[:id])
  end
  
end
