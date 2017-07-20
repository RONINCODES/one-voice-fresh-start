class ClassRoomsController < ApplicationController

  def index
    @user = current_user
    @class_rooms = @user.class_rooms.where("user_id = ?", @user)
  end

  def new

  end

  def create
    @user = current_user
    @class_room = @user.class_rooms.new(class_room_params)
    @class_room.user_id = @user.id

    if @class_room.save
      redirect_to user_class_rooms_path(params[:user_id])
    else
      render 'new'
    end
  end

  def destroy
    @class_room = ClassRoom.find(params[:id])
    @class_room.destroy

    #redirect_to (user profile or landing page??)
  end

private

  def class_room_params
    params.require(:class_room).permit(:subject, :group_code)
  end
end
