class CommentsController < ApplicationController

  def create
    @class_session = ClassSession.find(params[:id])
    @user = User.find(params[:user_id])
    @comment = @class_session.comments.new(comment_params)
    @comment.user = current_user


    if @comment.save
      redirect_to user_class_session_path(@user, @class_session)
    else
      render 'class_session/show'
    end
  end




  private

  def comment_params
    params.require(:comment).permit(:comment)

  end
end
