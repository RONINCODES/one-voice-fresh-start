class UsersController < ApplicationController

#security before action
#before_action :check_user, except: [:new, :create, :index]
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(session[:user_id])
    @class_room = ClassRoom.new
    @class_rooms = ClassRoom.where("user_id = ?", @user)
    @classrooms = ClassRoom.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Account successfully created!'
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      flash.now[:notice] = 'Sorry, try again!'
      redirect_to root_url
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
    params.require(:user).permit(:first_name, :last_name, :email, :role, :user_image, :password, :password_confirmation)
  end

end
