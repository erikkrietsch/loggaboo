class UserConfigController < ApplicationController
  include UsersHelper
  def show
  end
  
  def edit
    @user = current_user 
  end
  
  def update
    current_user.config.update_attributes(params[:user_config])
    if current_user.config.save
      flash[:notice] = "Preferences saved! #{current_user.config.time_zone}"
    else
      flash[:notice] = "Uh oh"
    end
    redirect_to :home
  end
end
