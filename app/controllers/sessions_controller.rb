class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth[:provider], auth[:uid])
    if user == nil
      user = User.create_with_omniauth(auth)
    end
    session[:user_id] = user.id
    session[:uid] = auth[:uid]
    flash[:notice] = "Signed in!"
    redirect_to :controller => :users, :action => :home
  end

  def destroy
    session[:user_id] = nil
    session[:uid] = nil
    flash[:notice] = "Signed out!"
    redirect_to root_url
  end
    
  def oauth_failure
    render :text => "Oops."
  end
end
