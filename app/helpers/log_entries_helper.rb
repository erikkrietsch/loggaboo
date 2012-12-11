module LogEntriesHelper
  include ApplicationHelper
  def entry_recorded_date(recorded_datetime)
    t_now = time_to_user_local(Time.now)
    d_now = Date.today
    recorded = time_to_user_local(recorded_datetime.to_time)#.in_time_zone(User.find(session[:user_id]).config.time_zone)
    datediff = (d_now - recorded_datetime.to_datetime)
    if datediff < 1
      return distance_of_time_in_words(recorded, t_now, true) + " ago"
    elsif datediff < 7
      return recorded_datetime.strftime("%a %-m/%y %l:%M %P")
    else
      return recorded_datetime.strftime("%-m/%e/%y %l:%M %P")
    end
  end
  
  def entry_details(log_entry)
    case log_entry.type
    when "breastfeed"
      return "#{log_entry.loggable.breast}, #{log_entry.loggable.duration} min"
    when "bottlefeed"
      return "#{log_entry.loggable.kind}, #{log_entry.loggable.amount} ML"
    when "diaper"
      return "#{log_entry.loggable.kind}"
    when "medicine"
      return "#{log_entry.loggable.kind}, #{log_entry.loggable.amount} #{log_entry.loggable.amount_uom}"
    when "sleep"
      return "#{log_entry.loggable.duration} min"
    end
  end
  
  def entry_icon(entry_type)
    return image_tag("/entry_icons/#{entry_type}.png", :title => entry_type, :class => "entry-icon")
  end
  
  def entry_menu_icon(entry_type, size="75x75", *options)
    return image_tag("/entry_icons/menu_#{entry_type}.png", :title => entry_type, :size => size, :class => "entry-menu-icon")
  end
  
  def entry_list_item(log_entry)
    return "#{entry_icon(log_entry.type)} #{entry_recorded_date(DateTime.to_user_local(log_entry.when))} #{entry_details(log_entry)}"
  end
  
end
