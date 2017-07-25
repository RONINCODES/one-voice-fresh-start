class SessionsController < ApplicationController

  def new
    @user = current_user
  end

  def create
    user_session = User.find_by(email: params[:session][:email])

    if user_session && user_session.authenticate(params[:session][:password])
      # Send a cookie to user's browser
      session[:user_id] = user_session.id
      redirect_to user_path(session[:user_id])
    else
      flash.now[:alert] = 'Incorrect email or password.'
      render '/' 
    end

  end

  def destroy
    # Clear the session cookie
    session[:user_id] = nil

    flash[:notice] = "You're logged out!"
    redirect_to root_url
  end
end
