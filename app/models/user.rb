class User < ActiveRecord::Base
  attr_accessible :open_id_token, :first_name, :last_name, :email
  has_and_belongs_to_many :babies
  has_many :log_entries, :as => :loggable
  has_many :logs_created, :class_name => "Log"
end
