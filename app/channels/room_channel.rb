class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
      stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    create_comment(data)
  end
  #method to save data aka messages/comments to database
  def create_comment(data)
    @class_session = ClassSession.first
    user = User.find(data['user_id'])
    # binding.pry
    @comment = @class_session.comments.create!(
      comment: data['text_field'],
      user: user
    )
    ActionCable.server.broadcast "room_channel", @comment

  end

end
#redifine class session and class user to find specific user and session
# @class_session = ClassSession.find(params[:class_session_id])
# @user = User.find(params[:user_id])
# @comment = @class_session.comments.new(comment_params)
# @comment.user = current_user

#when saved i want to braodcasrt that comment was saved to the channel

# then listen in on the javascript side to the broadcasts

#finally append message to the DOM.

#room.js
#and room_channel.rb
