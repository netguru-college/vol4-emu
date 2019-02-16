class PlacesController < ApplicationController

  def index
    @places = Place.all
=begin
    if params[:search].present?
      @places = Place.near(params[:search], 50, :order => :distance)
    else
      @places = Place.all
    end
=end
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
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
      redirect_to @place, :notice => "Successfully updated location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @place.destroy
    flash[:danger] = "The article was destroyed"
    redirect_to places_path
  end

  private

  def place_params
    params.require(:place).permit(:address)
  end

end