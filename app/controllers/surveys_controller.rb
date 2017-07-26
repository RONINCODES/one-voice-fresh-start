class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end


  def show
  @class_session = ClassSession.find(params[:class_session_id])
  @helpfulness1and2 = Survey('helpfulness = ? or helpfulness = ?', '1', '2' )date.where('date(created_at)=?', @class_session.created_at).count
  @helpfulness3 = Survey('helpfulness = ?', '3')date.where('date(created_at)=?', @class_session.created_at).count
  @helpfulness4and5 = Survey('helpfulness = ? or helpfulness = ?', '4', '5' )date.where('date(created_at)=?', @class_session.created_at).count

  @clarity1and2 = Survey('clarity = ? or clarity = ?', '1', '2' )date.where('date(created_at)=?', @class_session.created_at).count
  @clarity3 = Survey('clarity = ?', '1')date.where('date(created_at)=?', @class_session.created_at).count
  @clarity4and5 = Survey('clarity = ? or clarity = ?', '4', '5' )date.where('date(created_at)=?', @class_session.created_at).count

  @pace1and2 = Survey('pace = ? or pace = ?', '1', '2' )date.where('date(created_at)=?', @class_session.created_at).count
  @pace3 = Survey('pace = ?', '3')date.where('date(created_at)=?', @class_session.created_at).count
  @pace4and5 = Survey('pace = ? or pace = ?', '4', '5' )date.where('date(created_at)=?', @class_session.created_at).count

  @suggestions = Survey('suggestions.all').date.where('date(created_at)=?', @class_session.created_at)
  @allsurveys = Survey.all.where('date(created_at)=?', @class_session.created_at).count
  end

  def create
    @class_session = ClassSession.find(params[:class_session_id])
    @user = User.find(params[:user_id])
    @survey = @class_session.surveys.new(survey_params)
    @survey.user_id = @user.id
    if @survey.save
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
