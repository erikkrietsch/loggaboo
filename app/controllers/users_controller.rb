class UsersController < ApplicationController
  def home
    
    @user = User.find_by_auth_token(session[:uid])
    @babies = @user.babies
    :title = @user.display_name
  end
  
  def index
    
  end
  
  def login
    
  end
  
end
