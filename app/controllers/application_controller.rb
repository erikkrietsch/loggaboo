class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticationHelper

  protected 
  def authenticate
    unless logged_in?
      redirect_to :controller => :users, :action => :login
    end
  end
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?
end
