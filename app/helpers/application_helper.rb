module ApplicationHelper
  def standard_date(date)
    date.in_time_zone('Pacific Time (US & Canada)').strftime("%B %d, %Y at %l:%M %p") if date
  end
  
  def delivery_date(date)
    date.in_time_zone('Pacific Time (US & Canada)').strftime("%B %d, %Y") if date
  end

end
