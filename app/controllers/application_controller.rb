class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticationHelper

  protected 
  def authenticate
    unless logged_in?
      redirect_to :controller => :users, :action => :login
    end
  end
end
