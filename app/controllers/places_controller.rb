class PlacesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @places = Place.all
  end

  def show
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
  end

  def update
    if @place.update_attributes(params[:location])
      redirect_to @place, :notice => "Successfully updated location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path
    flash[:danger] = "The place was destroyed"
  end

  private

  def set_article
    @place = Place.find(params[:id])
  end


  def place_params
    params.require(:place).permit(:address)
  end

end