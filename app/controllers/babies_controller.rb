class BabiesController < ApplicationController
  before_filter :authenticate
  
  def new
    @baby = Baby.new
  end
  
  def create
    @baby = Baby.new(params[:baby])
    user = User.find_by_token(session[:uid])
    @baby.owner = user
    @baby.users << user
  end
  
  def list
  end

  def show
    @baby = Baby.find_by_id(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def delete
  end
  
  def destroy
  end
end
