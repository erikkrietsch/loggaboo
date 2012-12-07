class UserPermissionRequestsController < ApplicationController
  
  def new
    @upr = UserPermissionRequest.new
  end
  
  def create
    begin
      @requested_by = User.find_by_id(session[:user_id])
      @requested_of = User.find_by_email(params[:email])
      
      raise "User not found" unless @requested_of
      
      @upr = UserPermissionRequest.create(:requested_by_id => @requested_by.id, :requested_of_id => @requested_of.id)
      flash[:notice] = "Request sent to #{@requested_of.display_name}!"
      redirect_to :controller => :users, :action => :home
    rescue Exception => e
      flash[:notice] = e.message
      redirect_to :action => :new
    end
  end
  
  def list
    @user = User.find_by_id(session[:user_id])
    @user_requested = UserPermissionRequest.where(:requested_by_id => @user.id)
    @user_received = UserPermissionRequest.where(:requested_of_id => @user.id)
  end
  
  def show
    
  end
  
  def approve
  end
  
  def decline
  end
end
