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
      return "#{log_entry.loggable.kind}, #{log_entry.loggable.amount} oz."
    when "diaper"
      return "#{log_entry.loggable.kind}"
    when "medicine"
      return "#{log_entry.loggable.kind}, #{log_entry.loggable.amount} #{log_entry.loggable.amount_uom}"
    when "sleep"
      return "#{log_entry.loggable.duration} min"
    when "tummytime"
      return "#{log_entry.loggable.duration} min"
    when "pump"
      return "#{log_entry.loggable.amount} #{log_entry.loggable.amount_uom}, #{log_entry.loggable.duration} min"
    when "other"
      return truncate(log_entry.notes, :length => 40, :omission => "(con't)")
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
  
  def should_select_breast(which_breast)
    #checks to see if the last entry matches the breast we're asking about.  if not, return true (alternate based on last entry)
    @log_entry.log.log_entries.where(:loggable_type => "BreastFeedLogEntry").order("`log_entries`.`when` DESC").first.loggable.breast != which_breast if @log_entry.log.log_entries.where(:loggable_type => "BreastFeedLogEntry").any?
  end

  def should_select_bottle_kind(bottle_kind)
    #checks to see if the last entry matches the breast we're asking about.  if not, return true (alternate based on last entry)
    @log_entry.log.log_entries.where(:loggable_type => "BottleFeedLogEntry").order("`log_entries`.`when` DESC").first.loggable.kind == bottle_kind if @log_entry.log.log_entries.where(:loggable_type => "BottleFeedLogEntry").any?
  end  

  def should_select_pump_uom(uom)
    @log_entry.log.log_entries.where(:loggable_type => "PumpLogEntry").order("`log_entries`.`when` DESC").first.loggable.amount_uom == uom if @log_entry.log.log_entries.where(:loggable_type => "PumpLogEntry").any?
  end
end
