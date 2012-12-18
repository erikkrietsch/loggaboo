class LogsController < ApplicationController
  include UsersHelper
  before_filter :authenticate
  
  def show
    @log = Log.find_by_id(params[:id])
  end
  
  def test
    @user = current_user
  end
end
