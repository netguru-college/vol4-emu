class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    end
  end

private
  def event_params
    params.require(:event)
      .permit(:title, :description, :capacity, :started_at, :ended_at, :description)
  end
end
