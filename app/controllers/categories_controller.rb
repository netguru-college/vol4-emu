class CategoriesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(event_params)
    if @category.save
      flash[:success] = "Category was successfully saved"
      redirect_to @category
    else
      render :new
    end
  end

  private

  def set_article
    @category = Category.find(params[:id])
  end

  def event_params
    params.require(:category)
        .permit(:name)
  end


end