class RidesController < ApplicationController
  def create
    @user = User.find_by_id(params[:user_id])
    ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    ride_message = ride.take_ride
    flash[:notice] = ride_message
    redirect_to user_path(@user)
  end
end
