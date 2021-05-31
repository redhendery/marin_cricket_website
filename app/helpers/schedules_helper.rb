module SchedulesHelper
  def next_week
    Date.current..(Date.current + 6)
  end

  def last_week
    (Date.current - 6)..Date.current
  end

  def day
    date = Date.today
  end

end
