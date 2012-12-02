module AuthenticationHelper
  def logged_in?
    #return !session[:uid].blank?
    return true
    #return User.where(:auth_token => session[:uid], :id => session[:id]).first != nil
  end
end