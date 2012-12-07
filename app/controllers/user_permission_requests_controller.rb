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
    @user_requested = UserPermissionRequest.where(:requested_by_id => @user.id).order("updated_at DESC")
    @user_received = UserPermissionRequest.where(:requested_of_id => @user.id, :status => UserPermissionRequest::STATUS_PENDING).order("updated_at ASC")
  end
  
  def show
    @upr = upr_by_token
  end
  
  def approve
    update_upr_status(UserPermissionRequest::STATUS_APPROVED)
    upr = upr_by_token
    upr.requested_of.approve_user_permission_request(upr.requested_by_id)
  end
  
  def decline
    update_upr_status(UserPermissionRequest::STATUS_DECLINED)
  end
  
  protected
  
  def upr_by_token
    return UserPermissionRequest.find_by_token(params[:token])
  end
  
  def update_upr_status(new_status)
    upr = upr_by_token
    if upr.requested_of == User.find_by_id(session[:user_id])
      upr.status = new_status
      upr.save
      if new_status == UserPermissionRequest::STATUS_APPROVED
        flash[:notice] = "Request approved!"
      else
        flash[:notice] = "Request denied!"
      end
    else
      flash[:notice] = "Wha..?  Wrong user!"
    end 
    redirect_to :action => :list
  end
end
