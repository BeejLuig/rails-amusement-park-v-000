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
    unless logged_in? && (current_user == @user || current_user.admin? )
      flash[:notice] = "Access denied."
      redirect_to root_path
    end

  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :tickets, :height, :nausea, :happiness, :admin, :password)
  end
end
