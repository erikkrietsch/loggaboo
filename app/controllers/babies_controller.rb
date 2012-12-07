class BabiesController < ApplicationController
  before_filter :authenticate
  
  def new
    @baby = Baby.new
  end
  
  def create
    user = User.find_by_id(session[:user_id])
    @baby = Baby.new(params[:baby])
    @baby.owner = user
    @baby.users << user
    #add the users who have previously had permission requests approved
    users_to_add = UserPermissionRequest.where(:requested_of_id => user.id, :status => UserPermissionRequest::STATUS_APPROVED)
    users_to_add.each do |u|
      @baby.users << u.requested_by unless (@baby.owner == u.requested_by || @baby.users.include?(u.requested_by))
    end
    @baby.log = Log.create(:creator => user)
    @baby.save
    flash[:notice] = "Baby created!"
    redirect_to :action => :show, :id => @baby.id
  end
  
  def list
    @babies = User.find_by_token(session[:uid]).babies
  end

  def show
    @baby = Baby.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
  end
  
  def edit
  end
  
  def update
  end
  
  def delete
  end
  
  def destroy
    @baby = Baby.find_by_id(params[:id])
    if @baby.owner == User.find_by_id(session[:user_id])
      if @baby.destroy 
        flash[:notice] = "Baby record removed."
      end
    else
      flash[:notice] = "No way, Jose!  You're not that baby's daddy (or mommy!)"
    end
    redirect_to :controller => :users, :action => :home
  end
end
