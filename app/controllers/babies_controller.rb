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
    if @baby.destroy 
      flash[:notice] = "Baby record removed."
    end
    redirect_to :controller => :users, :action => :home
  end
end
