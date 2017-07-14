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

    if @user.save
      #redirect_to @user
      flash[:notice] = 'Account successfully created!'
      session[:user_id] = @user.id
      redirect_to users_path
      #redirect_to root_url
    else
      flash.now[:error] = 'Sorry, try again!'
      render :create
    end
  end

  def edit
    unless @user
      flash[:error] = "Must be logged in"
      redirect_to root_url and return
    end
  end

  def update
    unless @user
      flash[:error] = "Must Be Logged In"
      redirect_to root_url and return
    end

    @user.assign_attributes(user_params)

    if @user.save
      flash[:notice] = 'Account Succesfully Updated!'
      redirect_to edit_users_path
    else
      flash.now[:error] = 'Sorry, please try again!'
      render 'edit'
    end
  end

  def find_user
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    #redirect_to 'index'  -> not sure what to redirect to yet
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end

end
