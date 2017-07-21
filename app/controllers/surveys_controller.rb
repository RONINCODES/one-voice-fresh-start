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
