class ApplicationController < ActionController::Base

  helper_method :current_user
  #before_action :set_user, except: [:log_in, :log_out]

  def current_user
    if session[:user_id]
      @current_user  = User.find(session[:user_id])
    end  
  end

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
    # redirect_to public_rooms_path
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  private
  def set_user
    UserInfo.current_user = current_user
  end
end
