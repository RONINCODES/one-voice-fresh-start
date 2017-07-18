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
    @survey = Survey.new(survey_params)

    if @survey.save
      flash[:notice] = 'Thank you, That\'s some great feedback!'
      #render ''

  end

private
  def survey_params
    params.require(:survey).permit(:helpfulness, :clarity, :pace, :suggestions)
  end

end
