class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    current_user.session_token == session[:session_token]
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def log_out_user!
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_sessions_url
  end

end
