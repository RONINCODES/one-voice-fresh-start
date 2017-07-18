class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.first_name == 'mohammed'
      @user.role = 'instructor'
      @user.save
    else @user.role = 'student'
      @user.save
    end

    if @user.save
      #redirect_to @user
      flash[:notice] = 'Account successfully created!'
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
      #redirect_to root_url
    else
      flash.now[:error] = 'Sorry, try again!'
      render :create
    end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = 'Account Succesfully Updated!'
      redirect_to user_path
    else
      flash.now[:error] = 'Sorry, please try again!'
      render 'edit'
    end
  end

  def find_user
    @user = current_user
  end

  def destroy
    session[:user_id] = nil
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end

end