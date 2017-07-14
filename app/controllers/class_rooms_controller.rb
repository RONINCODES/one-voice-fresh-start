class ClassRoomsController < ApplicationController

  def index
    @class_rooms = ClassRoom.all
  end

  def new
    @class_room = ClassRoom.new
  end

  def create
    @class_room = ClassRoom.new(class_room_params)

    if @class_room.save
      #redirect_to (the actual classroom)
    else
      render 'new'
    end
  end

  def destroy
    @class_room = ClassRoom.find(params[:id])
    @class_room.destroy

    #redirect_to (user profile or landing page??)
  end



end
