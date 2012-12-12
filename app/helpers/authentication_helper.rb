module AuthenticationHelper
  def logged_in?
    return (not session[:uid].blank?)
    #return true
    #return User.where(:auth_token => session[:uid], :id => session[:id]).first != nil
  end
  
  def ensure_logged_in
    if not logged_in?
      redirect_to root_url
    end
  end
end