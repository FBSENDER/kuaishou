module ApplicationHelper
  def format_time(time)
    (time + 8.hours).strftime("%F %H:%M")
  end
end
