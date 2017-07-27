class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user

    session[:user_id] && User.find(session[:user_id])
  end


# Security - restricting access
  def check_user

    if params[:id].to_i != session[:user_id]
      redirect
    end
  end

  def check_class_room
    if params[:id].to_i != class_rooms[:user_id]
      redirect
    end
  end

  def check_class_session
    if params[:id].to_i != class_sessions[:user_id]
      redirect
    end
  end



  private

  def redirect
    redirect_to '/'
  end
end
