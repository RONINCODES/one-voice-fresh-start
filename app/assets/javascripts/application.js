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

  // var close = document.querySelector('.close');
  // var submit = document.querySelector('.submit');

  //-------------------------------------------------------------------------------------
  // When the user presses the .signin button, fade in the modal window

  function showModalWindowSignIn(click) {
    modalSignIn.style.display = 'block';
  };
  // SignIn.addEventListener('click', showModalWindowSignIn);

  //-------------------------------------------------------------------------------------
  // When the user presses the .signup button, fade in the modal window

  function showModalWindowSignUp(click) {
    modalSignUp.style.display = 'block';
  };
  // SignUp.addEventListener('click', showModalWindowSignUp);


  // When the user presses the .close button, fade out the modal window

  function hideModalWindow(click) {
    modal.style.display = 'none';
  };

  // close.addEventListener('click', hideModalWindow);

  //-------------------------------------------------------------------------------------
  // When the user presses the .submit button, add an .error class to both input elements

  function addError(click) {
    var user = document.getElementById('user');
    user.className = 'error';
    var password = document.getElementById('pass');
    password.className = 'error';
  };

  // submit.addEventListener('click', addError);

  //-------------------------------------------------------------------------------------
  // When the user puts their cursor in one of the input fields, remove the .error class

  var inputFields = document.querySelectorAll('input');

  function removeError(click) {
    var user = document.getElementById('user');
    this.className = null;
    var password = document.getElementById('pass');
    this.className = null;
  };

  // inputFields[0].addEventListener('click', removeError);
  // inputFields[1].addEventListener('click', removeError);

  //-------------------------------------------------------------------------------------

// End of 'DOMContentLoaded':
});
