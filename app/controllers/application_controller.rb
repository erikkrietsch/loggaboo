class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  include AuthenticationHelper

  before_filter :prepare_for_mobile
  before_filter :ensure_logged_in
  
  protected 
  def authenticate
    unless logged_in?
      redirect_to :controller => :users, :action => :login
    end
  end
  helper_method :authenticate
  
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?
  
  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
  
  def show_title?
    true
  end
  helper_method :show_title?
end
