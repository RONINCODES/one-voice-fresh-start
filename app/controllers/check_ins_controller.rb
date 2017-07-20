class CheckInsController < ApplicationController


  def new
    @check_in = CheckIn.new
  end

  def create
    @check_in = CheckIn.new(check_in_params)

    if @check_in.save
      #redirect_to @user
      flash[:notice] = 'Account successfully created!'
      session[:user_id] = @check_in.id
      redirect_to user_path(session[:user_id])
      #redirect_to root_url
    else
      flash.now[:error] = 'Sorry, try again!'
      render :new
    end
  end

  private

  def check_in_params
    params.require(:check_in).permit(:class_session_id, :user_id)
  end

end
