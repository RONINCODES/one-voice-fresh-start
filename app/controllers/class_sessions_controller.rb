class ClassSessionsController < ApplicationController

  def index
    @class_sessions = ClassSession.all
  end

  def new
    @class_session = ClassSession.new
  end

  def create
    @class_session = ClassSession.new(class_session_params)

    if @class_session.save
      #redirect_to @class_session --> will probably want to redirect to the actual classroom - once the session has been created???
    else
      render 'new'
    end
  end

  def destroy
    @class_session = ClassSession.find(params[:id])
    @class_session.destroy

    #redirect_to (probably Instructor's user profile )
  end


end
