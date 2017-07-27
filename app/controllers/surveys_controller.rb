class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end


  def show

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
