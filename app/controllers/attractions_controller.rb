class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:notice] = "Attraction successfully created."
      redirect_to attraction_path(@attraction)
    else
      flash[:notice] = "Failed to create attraction."
      render :new
    end
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = current_user
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    if @attraction.update(attraction_params)
      flash[:notice] = "Attraction successfully updated."
      redirect_to attraction_path(@attraction)
    else
      flash[:notice] = "Failed to update attraction."
      render :edit
    end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def destroy
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.destroy
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
