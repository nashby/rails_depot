module ApplicationHelper
  def get_time
    t = Time.new
    t.strftime("Displayed on %d/%m/%Y - %H-%M-%S")
  end
end
