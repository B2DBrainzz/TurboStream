class SessionsController < ApplicationController

    def create
      user = User.find_by(username: params[:session][:username])
      cookies.signed[:username] = params[:session][:username]
      if user
        log_in(user)
      else
        render 'new'
      end
    end
  
    def destroy
      log_out if logged_in?
      flash[:success] = 'Successfully logged out!'
      redirect_to root_url
    end
end