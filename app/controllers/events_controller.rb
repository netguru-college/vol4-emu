class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :update, :show, :destroy, :join, :leave]

  def index
      @filterrific = initialize_filterrific(
        Event,
        params[:filterrific],
        select_options: {
          with_sport_id: Sport.options_for_select,
        },
        persistence_id: "shared_key",
        default_filter_params: {},
        available_filters: [:search_query, :with_sport_id],
        sanitize_params: true,
      ) || return
      @events = @filterrific.find

      respond_to do |format|
        format.html
        format.js
      end

    rescue ActiveRecord::RecordNotFound => e
      puts "Had to reset filterrific params: #{e.message}"
      redirect_to(reset_filterrific_url(format: :html)) && return
    end

  def show
  end

  def new
    @event = Event.new
    @event.build_sport
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:success] = "Event was created"
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to @event
      flash[:notice] = "Event was updated"
    else
      render 'edit'
    end
  end


  def destroy
    @event.destroy
    redirect_to events_path
    flash[:danger] = "Event was destroyed"
  end

  def join
    @event.users << current_user
    redirect_back(fallback_location: root_path)
  end

  def leave
    @event.users.delete(current_user)
    redirect_back(fallback_location: root_path)
  end

  def list_participants
    @users = Event.find(params[:id]).users
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :capacity, :started_at, :ended_at, :description, :sport_id)
  end

end
