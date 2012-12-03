module LogEntriesHelper
  def entry_recorded_date(recorded_datetime)
    dt_now = DateTime.now
    recorded_dt = recorded_datetime.to_datetime
    datediff = (dt_now - recorded_dt)
    if datediff < 1
      return distance_of_time_to_now(recorded_dt, true) + " ago"
    elsif datediff < 7
      return recorded_dt.strftime("%a %I:%M %P")
    else
      return recorded_dt.strftime("%m/%e/%y %I:%M %P")
    end
  end
  
  def entry_details(log_entry)
    case log_entry.type
    when "breastfeed"
      return "#{log_entry.loggable.which}, #{log_entry.loggable.duration} min"
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
    return image_tag("/entry_icons/#{entry_type}.png", :size => "50x50", :title => entry_type, :class => "entry-icon", :style => "float:left;")
  end
  
  def entry_list_item(log_entry)
    return "#{entry_icon(log_entry.type)} #{entry_recorded_date(log_entry.when)} #{entry_details(log_entry)}"
  end
  
end
