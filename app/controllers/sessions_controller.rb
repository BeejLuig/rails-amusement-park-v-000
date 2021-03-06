class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      flash[:notice] = "Welcome back to the theme park!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Login failed."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
