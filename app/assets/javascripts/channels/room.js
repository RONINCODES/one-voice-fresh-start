App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data)
    document.querySelector('#comments').insertAdjacentHTML('beforeend', '<div class="comment"><b>' + data.name + ' says: </b><br> ' + data.comment.comment + '<hr><small>'  + '</small></div>')
    var t = document.getElementById('comment_comment');
    t.value = t.defaultValue;
    window.scrollTo(0,document.body.scrollHeight);


  }
});




// wrap an event listener around the comment form and submit buttons
// select the text that goes into the comment text box /appending to the room
document.addEventListener('DOMContentLoaded', function(event) {

  var commentForm = document.querySelector('#comment-add-form');
  commentForm.addEventListener("submit", function(evt) {
      evt.preventDefault();
      var comment_text_field = document.querySelector('#comment_comment');
      var path_array = window.location.pathname.split('/')
      var class_session_ID = path_array[path_array.length-1]
      App.room.send({
        text_field: comment_text_field.value,
        user_id: userId,
        class_session_id: class_session_ID

      })
      console.log('howdy')
  }, true);
  document.getElementById("comment_comment").addEventListener("keyup", function(event) {
    event.preventDefault();
    if (event.keyCode == 13) {

      if (event.shiftKey) {
      this.value = this.value + '<br>'
      console.log(this.value)
      }
      else {
      document.getElementById("submit_comment").click();
      }

    }

});

});
