class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?, :current_user

  def signed_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
