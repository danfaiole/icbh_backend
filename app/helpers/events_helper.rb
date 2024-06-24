module EventsHelper
  def events_counter_helper
    unless cookies[:events_counter].present?
       cookies[:events_counter] = Event.select(1).where("date_part('month', start_date) = ?", Time.now.month).count
    end

    cookies[:events_counter]
  end
end
