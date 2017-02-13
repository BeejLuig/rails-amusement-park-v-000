class UsersController < ApplicationController
  def index

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Failed to sign up. Try again."
      render :new
    end
  end

  def new

  end

  def update

  end

  def edit

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :tickets, :height, :nausea, :happiness, :admin, :password)
  end
end
