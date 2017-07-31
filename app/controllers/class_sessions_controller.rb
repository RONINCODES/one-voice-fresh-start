class ClassSessionsController < ApplicationController

  def index
    @user = current_user
    @class_room = ClassRoom.find(params[:class_room_id])
    @class_sessions = @class_room.class_sessions.where("class_room_id= ?", @class_room.id)
    @classsessions = ClassSession.all
  end

  def show
    @class_room = ClassRoom.find(params[:class_room_id])
    @class_session = ClassSession.find(params[:id])
    @class_session.users
    @users = @class_session.users
    @user = User.find(params[:user_id])
    @survey = Survey.new
    @comments = @class_session.comments.all
    CheckIn.check_in(@user, @class_session)


    #analytics logic

    @helpfulness1and2 = Survey.where('helpfulness=? or helpfulness= ?','1','2').where(class_session_id: params[:id]).count

    @helpfulness3 = Survey.where(helpfulness:'3').where(class_session_id: params[:id]).count
    @helpfulness4and5 = Survey.where('helpfulness= ? or helpfulness= ?','4','5' ).where(class_session_id: params[:id]).count

    @clarity1and2 = Survey.where('clarity =? or clarity =?', '1', '2' ).where(class_session_id: params[:id]).count
    @clarity3 = Survey.where(clarity:'3').where(class_session_id: params[:id]).count
    @clarity4and5 = Survey.where('helpfulness= ? or helpfulness= ?','4','5' ).where(class_session_id: params[:id]).count

    @pace1and2 = Survey.where('pace =? or pace =?', '1', '2' ).where(class_session_id: params[:id]).count
    @pace3 = Survey.where(pace:'3').where(class_session_id: params[:id]).count
    @pace4and5 = Survey.where('pace= ? or pace= ?','4','5' ).where(class_session_id: params[:id]).count
    @suggestions = Survey.where(class_session_id: params[:id])

    res = Typhoeus::Request.get(
          "https://gateway.watsonplatform.net/discovery/api/v1/environments/37e227de-a4ec-4574-aa19-8d52307fcb70/collections/a9ea5772-9961-4130-92ed-01cf9b9876bb/query?version=2017-07-19&count=&offset=&aggregation=term%28enriched_text.sentiment.document.label%2Ccount%3A3%29&filter=#{@class_room.id}#{@class_session.id}&passages=true&highlight=true&return=&query=",
          userpwd: "#{ENV['WATSON_KEY']}:#{ENV['WATSON_PASS']}")
    @body = JSON.parse(res.body)

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
