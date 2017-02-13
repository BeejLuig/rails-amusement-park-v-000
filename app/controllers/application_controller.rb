class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    if current_user
      true
    else
      false
    end
  end
  helper_method :current_user
  helper_method :logged_in?
  protect_from_forgery with: :exception

end
