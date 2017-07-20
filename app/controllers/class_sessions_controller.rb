class ClassSessionsController < ApplicationController

  def index
    @user = current_user
    @class_room = ClassRoom.find(params[:class_room_id])
    @class_sessions = @class_room.class_sessions.where("class_room_id= ?", @class_room.id)
    @classsessions = ClassSession.all
  end

  def show
    @users = User.where(class_sessions_id: params[:class_sessions_id])
    @class_session = ClassSession.find(params[:id])
    #@users = User.all
    @user = User.find(params[:user_id])
    @survey = Survey.new
    @comments = Comment.where(class_session_id: params[:id])
  end

  def new
    @class_session = ClassSession.new
  end

  def create
    @class_room = ClassRoom.find(params[:class_room_id])
    @class_session = @class_room.class_sessions.new(class_session_params)
    @class_session.user_id = current_user.id
    if @class_session.save
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  def destroy
    @class_session = ClassSession.find(params[:id])
    @class_session.destroy

    #redirect_to (probably Instructor's user profile )
  end


private
  def class_session_params
    params.require(:class_session).permit(:date, :agenda)
  end

end
