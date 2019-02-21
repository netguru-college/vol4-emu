class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :show, :destroy, :join, :leave]

  rescue_from Pundit::NotAuthorizedError do
    flash[:warning] = "You don't have access to this page"
    redirect_to events_path
  end

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
      @events = @filterrific.find.page params[:page]
      @events = @events.order('started_at ASC')

      respond_to do |format|
        format.html
        format.js
      end

  rescue ActiveRecord::RecordNotFound => e
    puts "Had to reset filterrific params: #{e.message}"
    redirect_to(reset_filterrific_url(format: :html)) && return
    authorize @events
  end

  def show
  end

  def new
    @event = Event.new
    authorize @event
    @event.build_sport
    @event.build_place
  end

  def edit
  end

  def create
    @event = current_user.create_event_as_owner(event_params)
    # @event.create_place(event_params[:place_attributes])
    @event.create_place_with_coords(event_params[:place_attributes])
    authorize @event

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
    if @event.users.size < @event.capacity
      @event.users << current_user
      @event.participations.find_by(user: current_user).participant!
      flash[:success] = "You have joined the event!"
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event)
      flash[:danger] = "This event is full"
    end
  end

  def leave
    @event.users.delete(current_user)
    flash[:success] = "You have left event!"
    redirect_back(fallback_location: root_path)
  end

  def list_participants
    @users = Event.find(params[:id]).users
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event)
        .permit(:title, :capacity, :started_at, :ended_at, :description, :sport_id,
                place_attributes: [:name, :owner, :phone_number])
  end

end
