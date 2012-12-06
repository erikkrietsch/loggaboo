class UsersController < ApplicationController
  def home
    @user = User.find_by_auth_token(session[:uid])
    @babies = @user.babies
  end
  
  def index
    
  end
  
  def login
    
  end
  
  def revoke
  end
  
end
