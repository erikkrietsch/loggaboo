class UserPermissionRequest < ActiveRecord::Base
  STATUS_PENDING = 0
  STATUS_APPROVED = 1
  STATUS_DECLINED = 2
  STATUS_TEXT = Array.new(3)
  STATUS_TEXT[STATUS_PENDING] = "pending"
  STATUS_TEXT[STATUS_APPROVED] = "approved"
  STATUS_TEXT[STATUS_DECLINED] = "declined"
  
  attr_accessible :requested_by_id, :requested_of_id
  before_create :generate_token, :set_status_changed, :ensure_not_request_self, :ensure_not_repeat

  belongs_to :requested_by, :class_name => "User", :foreign_key => :requested_by_id
  belongs_to :requested_of, :class_name => "User", :foreign_key => :requested_of_id

  def status_text
    return STATUS_TEXT[self.status]
  end

  protected

  def generate_token
    begin
      token = SecureRandom.urlsafe_base64
    end while UserPermissionRequest.where(:token => token).exists?
    self.token = token
  end
  
  def set_status_changed
    self.status_changed = DateTime.now
  end
  
  def ensure_not_request_self
    raise "You can't request yourself, silly!" if self.requested_by_id == self.requested_of_id
  end
  
  def ensure_not_repeat
    raise "Request already exists." if UserPermissionRequest.where(:requested_by_id => self.requested_by_id, :requested_of_id => self.requested_of_id).count > 0
  end
end
