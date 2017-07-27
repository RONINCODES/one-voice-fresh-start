class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end


  def show
  # @class_session = ClassSession.find(params[:class_session_id])

  @helpfulness1and2 = Survey.where('helpfulness=? or helpfulness= ?','1','2').where(class_session_id: params[:class_session_id]).count
  @helpfulness3 = Survey.where(helpfulness:'3').where(class_session_id: params[:class_session_id]).count
  @helpfulness4and5 = Survey.where('helpfulness= ? or helpfulness= ?','4','5' ).where(class_session_id: params[:class_session_id]).count

  @clarity1and2 = Survey.where('clarity =? or clarity =?', '1', '2' ).where(class_session_id: params[:class_session_id]).count
  @clarity3 = Survey.where(clarity:'3').where(class_session_id: params[:class_session_id]).count
  @clarity4and5 = Survey.where('helpfulness= ? or helpfulness= ?','4','5' ).where(class_session_id: params[:class_session_id]).count

  @pace1and2 = Survey.where('pace =? or pace =?', '1', '2' ).where(class_session_id: params[:class_session_id]).count
  @pace3 = Survey.where(pace:'3').where(class_session_id: params[:class_session_id]).count
  @pace4and5 = Survey.where('pace= ? or pace= ?','4','5' ).where(class_session_id: params[:class_session_id]).count


  # .where('date(created_at)=?', @class_session.created_at).count
  # @helpfulness3 = Survey('helpfulness = ?', '3')date.where('date(created_at)=?', @class_session.created_at).count
  #
  # @clarity1and2 = Survey('clarity = ? or clarity = ?', '1', '2' )date.where('date(created_at)=?', @class_session.created_at).count
  # @clarity3 = Survey('clarity = ?', '1')date.where('date(created_at)=?', @class_session.created_at).count
  # @clarity4and5 = Survey('clarity = ? or clarity = ?', '4', '5' )date.where('date(created_at)=?', @class_session.created_at).count
  #
  #@pace1and2 = Survey('pace = ? or pace = ?', '1', '2' ).where('date(created_at)=?', @class_session.created_at).count
  # @pace3 = Survey('pace = ?', '3')date.where('date(created_at)=?', @class_session.created_at).count
  # @pace4and5 = Survey('pace = ? or pace = ?', '4', '5' )date.where('date(created_at)=?', @class_session.created_at).count
  #
   @suggestions = Survey.where(class_session_id: params[:class_session_id])
  # @allsurveys = Survey.all.wherewhere('date(created_at)=?', @class_session.created_at).count
  end

  def create
    @class_room = ClassRoom.find(params[:class_room_id])
    @class_session = ClassSession.find(params[:class_session_id])
    @user = User.find(params[:user_id])
    @survey = @class_session.surveys.new(survey_params)
    @survey.user_id = @user.id
    if @survey.save
      c = File.new("#{Rails.root}/public/suggestions.html", "w+")
      c.write("<p>#{@class_room.id}#{@class_session.id}: #{@survey.suggestions}</p>")
      c.read
      Typhoeus.post(
        "https://gateway.watsonplatform.net/discovery/api/v1/environments/37e227de-a4ec-4574-aa19-8d52307fcb70/collections/a9ea5772-9961-4130-92ed-01cf9b9876bb/documents?version=2017-07-19",
        userpwd: "#{ENV['WATSON_KEY']}:#{ENV['WATSON_PASS']}",
        body: {
          title: "test post",
          content: "this is my test",
          file: File.open("#{Rails.root}/public/suggestions.html", "r")
        }
      )
      redirect_to user_path(@user)
    else
      render 'class_session/show'
    end
  end

private
  def survey_params
    params.require(:survey).permit(:helpfulness, :clarity, :pace, :suggestions)
  end

end
