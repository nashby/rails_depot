module ApplicationHelper
  def get_time
    t = Time.zone.now
    t.strftime("Displayed on %d/%m/%Y - %H-%M-%S")
  end
end
