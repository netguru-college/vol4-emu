class PlacesController<ApplicationController

  def index
    if params[:search].present?
      @places = Place.near(params[:search], 50, :order => :distance)
    else
      @places = Place.all
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params[:place])
    if @place.save
      redirect_to @place, :notice => "Successfully created place."
    else
      render :action => 'new'
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(params[:location])
      redirect_to @place, :notice  => "Successfully updated location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_url, :notice => "Successfully destroyed location."
  end

end