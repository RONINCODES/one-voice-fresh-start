class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end

  def create
    @class_session = ClassSession.find(params[:class_session_id])
    @user = User.find(params[:user_id])
    @comment = @class_session.comments.new(comment_params)
    @comment.user = current_user


    if @comment.save
      redirect_to users_path
    else
      render 'class_session/show'
    end
  end




  private

  def comment_params
    params.require(:comment).permit(:comment)

  end
end
