class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  after_action :count_events, only: [:create, :destroy]

  def index
    @events = Event.where(start_date: params[:start]..params[:end])

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Evento criado com sucesso.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Evento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Evento apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).
        permit(
          :start_date, :end_date, :title, :description, :location,
          :color, :start, :end, :start_time, :end_time,
          event_notifications_attributes: [:id, :_destroy, :date, :title, :body]
        )
    end
end
