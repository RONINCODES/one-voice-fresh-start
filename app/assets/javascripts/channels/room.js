App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
// wrap an event listener around the comment form and submit buttons
// select the text that goes into the comment text box /appending to the room
document.addEventListener('DOMContentLoaded', function(event) {
  var commentForm = document.querySelector('#comment-add-form');
  commentForm.addEventListener("submit", function(evt) {
      evt.preventDefault();
      var comment_text_field = document.querySelector('#comment_comment');
      App.room.send({text_field: comment_text_field.value})
      console.log('howdy')
  }, true);

});


// if (element.addEventListener) {
//     element.addEventListener("submit", function(evt) {
//         evt.preventDefault();
//         window.history.back();
//     }, true);
// }
// else {
//     element.attachEvent('onsubmit', function(evt){
//         evt.preventDefault();
//         window.history.back();
//     });
// }
//
