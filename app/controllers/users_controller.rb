class UsersController < ApplicationController
  skip_before_filter :ensure_logged_in, :only => [:index, :login]

  def home
    @user = User.find_by_auth_token(session[:uid])
    begin
      @user.last_login = DateTime.now
      @user.save
    rescue 
    end
    @babies = @user.babies
  end
  
  def index
    
  end
  
  def login
    logged_in? ? redirect_to(:action => :home) : redirect_to( "/auth/#{params[:provider]}/")
  end
  
  def menu
  end
  
end
