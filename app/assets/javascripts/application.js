// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

document.addEventListener('DOMContentLoaded', function(event) {

  // Declare variables for click events:

  var modalSignIn = document.querySelector('#sign_in');
  var modalSignUp = document.querySelector('#sign_up');
  var signIn = document.querySelector('.signin');
  var signUp = document.querySelector('.signup');
  var close = document.querySelector('.close');
  // var submit = document.querySelector('.submit');

  //-------------------------------------------------------------------------------------
  // When user presses SIGN IN button, fade in the modal window
  function showModalWindowSignIn(click) {
    modalSignIn.style.display = 'block';
  };
  signIn.addEventListener('click', showModalWindowSignIn);

  // When user presses SIGN UP button, fade in the modal window
  function showModalWindowSignUp(click) {
    modalSignUp.style.display = 'block';
  };
  signUp.addEventListener('click', showModalWindowSignUp);

  // When user presses CLOSE button, fade out the modal window
  function hideModalWindowSignIn(click) {
    modalSignIn.style.display = 'none';
  };
  close.addEventListener('click', hideModalWindowSignIn);


  // When user presses CLOSE button, fade out the modal window
  function hideModalWindowSignUp(click) {
    modalSignUp.style.display = 'none';
  };
  close.addEventListener('click', hideModalWindowSignUp);


// End of 'DOMContentLoaded':
});
