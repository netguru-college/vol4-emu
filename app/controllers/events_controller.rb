class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :update, :show, :destroy]

  def index
    @events = Event.all
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
    if @event.save
      flash[:success] = "Event was created"
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to @event, :notice => "Successfully updated location."
    else
      render 'edit'
    end
  end


  def destroy
    @event.destroy
    redirect_to events_path
    flash[:danger] = "The place was destroyed"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event)
        .permit(:title, :description, :capacity, :started_at, :ended_at, :description)
  end

end
