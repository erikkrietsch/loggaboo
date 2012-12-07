OmniAuth.config.full_host = "http://poopsy.totesrad.com"
OmniAuth.config.on_failure = SessionsController.action(:oauth_failure)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_OAUTH2_CLIENTID"], ENV["GOOGLE_OAUTH2_KEY"], :access_type => "online", :scope => "userinfo.profile,userinfo.email" 
end
