class API::V1::EventsController < ApiController
  def index
    @events = Event.where(
      start_date: params[:startDate].to_date..params[:endDate].to_date
    )

    render json: @events
  end

  def show
    @event = Event.find_by(id: event_params[:id])

    render json: @event
  end

  private

  def event_params
    params.permit(:id, :startDate, :endDate)
  end
end