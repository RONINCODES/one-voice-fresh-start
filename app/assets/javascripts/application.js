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

//= require_tree .

document.addEventListener('DOMContentLoaded', function(event) {

  //-------------------------------------------------------------------------------------
  // Declare variables for click events:
  var modalSignIn = document.querySelector('#sign_in');
  var modalSignUp = document.querySelector('#sign_up');
  var signIn      = document.querySelector('.signin');
  var signUp      = document.querySelector('.signup');
  var closeSignIn = document.querySelector('.close_sign_in');
  var closeSignUp = document.querySelector('.close_sign_up');

  //-------------------------------------------------------------------------------------
  // When user presses SIGN IN button, fade in the modal window



  if (modalSignIn != undefined) {
    function showModalSignIn(click) {
      modalSignIn.style.display = 'block';
    };
    signIn.addEventListener('click', showModalSignIn);
  };

  // When user presses SIGN UP button, fade in the modal window
  if (modalSignUp != undefined) {
    function showModalSignUp(click) {
      modalSignUp.style.display = 'block';
    };
    signUp.addEventListener('click', showModalSignUp);
  };
  //-------------------------------------------------------------------------------------
  // When user presses CLOSE button, fade out the SIGN IN modal window
  if (modalSignIn != undefined) {
    function hideModalSignIn(click) {
      modalSignIn.style.display = 'none';
    };
    closeSignIn.addEventListener('click', hideModalSignIn);
  };

// When user presses CLOSE button, fade out the SIGN UP modal window
  if (modalSignUp != undefined) {
    function hideModalSignUp(click) {
      modalSignUp.style.display = 'none';
    };
    closeSignUp.addEventListener('click', hideModalSignUp);
  };
  //-------------------------------------------------------------------------------------
  // EDIT PROFILE:

  var editProfile = document.querySelector('.edit_profile'); // The link.
  var modalEdit   = document.querySelector('#edit_profile'); // The modal.
  var closeEdit   = document.querySelector('.close_edit');

  // Open the modal:

  if (modalEdit != undefined) {
    function showModalEdit(click) {
      console.log('You should see the Edit Profile modal now.');
      modalEdit.style.display = 'block';
    };
    editProfile.addEventListener('click', function(event) {
      event.preventDefault();
      console.log('The Edit Profile link was clicked.')
      showModalEdit();
    });
  };


  // When user presses CLOSE button, fade out the SIGN IN modal window
  if (modalEdit != undefined) {
    function hideModalEdit(click) {
      modalEdit.style.display = 'none';
    };
    closeEdit.addEventListener('click', hideModalEdit);
  };

  //-------------------------------------------------------------------------------------

  // CREATE A CLASSROOM:

  var createClassroom = document.querySelector('.create_classroom'); // The link.
  var modalCreate   = document.querySelector('#create_classroom'); // The modal.
  var closeCreate   = document.querySelector('.close_create');

  // Open the modal:
  if (modalCreate != undefined) {
    function showModalCreate(click) {
      console.log('You should see the Create Classroom modal now.');
      modalCreate.style.display = 'block';
    };
    createClassroom.addEventListener('click', function(event) {
      event.preventDefault();
      console.log('The Create Classroom button was clicked.')
      showModalCreate();
    });
  };

  // Close the modal:
  if (modalCreate != undefined) {
    function hideModalCreate(click) {
      modalCreate.style.display = 'none';
    };
    closeCreate.addEventListener('click', hideModalCreate);
  };



  //-------------------------------------------------------------------------------------

// End of 'DOMContentLoaded':
});
