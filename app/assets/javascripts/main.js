document.addEventListener('DOMContentLoaded', function(event) {

  // Declare variables for click events:
  var modal = document.querySelector('.modal');
  var signIn = document.querySelector('.signin'); //button
  var signUp = document.querySelector('.signup'); //button
  var close = document.querySelector('.close');
  var submit = document.querySelector('.submit');

  //-------------------------------------------------------------------------------------
  // When the user presses the .signin button, fade in the modal window

  function showModalWindow(click) {
    modal.style.display = 'block';
  };

  signIn.addEventListener('click', showModalWindow);

  //-------------------------------------------------------------------------------------
  // When the user presses the .close button, fade out the modal window

  function hideModalWindow(click) {
    modal.style.display = 'none';
  };

  close.addEventListener('click', hideModalWindow);

  //-------------------------------------------------------------------------------------
  // When the user presses the .submit button, add an .error class to both input elements

  function addError(click) {
    var user = document.getElementById('user');
    user.className = 'error';
    var password = document.getElementById('pass');
    password.className = 'error';
  };

  submit.addEventListener('click', addError);

  //-------------------------------------------------------------------------------------
  // When the user puts their cursor in one of the input fields, remove the .error class

  var inputFields = document.querySelectorAll('input');

  function removeError(click) {
    var user = document.getElementById('user');
    this.className = null;
    var password = document.getElementById('pass');
    this.className = null;
  };

  inputFields[0].addEventListener('click', removeError);
  inputFields[1].addEventListener('click', removeError);

  //-------------------------------------------------------------------------------------

// End of 'DOMContentLoaded':
});
