module ApplicationHelper
  include UsersHelper
  def time_to_user_local(time)
    return time.in_time_zone(current_user.config.time_zone)
  end
end
