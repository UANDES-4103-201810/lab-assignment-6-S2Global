class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    @_current_user ||= session[:current_user] && User.find_by(id: session[:current_user])
  end

  def is_user_logged_in?
  	logged_in = false
    if session[:logged_in]
      logged_in = true
    end
    if logged_in then true end
    else
      redirect_to root_path
  end

end
