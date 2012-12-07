class User < ActiveRecord::Base
  attr_accessible :auth_token, :auth_provider, :first_name, :last_name, :email, :display_name
  has_and_belongs_to_many :babies
  has_many :log_entries, :as => :loggable
  has_many :logs_created, :class_name => "Log"
  
  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
  
  def has_requests?
    return UserPermissionRequest.where(:requested_of_id => self.id, :status => UserPermissionRequest::STATUS_PENDING).count > 0
  end
  
  def approve_user_permission_request(requesting_user_id)
    requesting_user = User.find_by_id(requesting_user_id)
    self.babies.each do |b|
      b.users << requesting_user unless b.owner == requesting_user || b.users.include?(requesting_user)
    end
  end
  
  def User.find_by_provider_and_uid(provider, uid)
    User.where(:auth_token => uid, :auth_provider => provider).first
  end
  
  def User.create_with_omniauth(auth)
    #look up the user's email address first, in case they revoked access and came back.
    user = User.find_by_email(auth[:info][:email])

    case auth[:provider]
    when "google_oauth2"
      if user
        #Update the existing record with the token
        user.auth_token = auth[:uid]
        user.first_name = auth[:info][:first_name]
        user.last_name = auth[:info][:last_name]
        user.save
      else
        user = User.create(:auth_provider => auth[:provider], :auth_token => auth[:uid], :email => auth[:info][:email], :first_name => auth[:info][:first_name], :last_name => auth[:info][:last_name], :display_name => auth[:info][:first_name])
      end
    end
    return user
  end
end
