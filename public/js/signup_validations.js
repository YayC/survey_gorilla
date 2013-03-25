// all of these validations are also present as html-5 validations on the form; 
// we use main.css (selecting 'required:valid' and 'required:invalid') to add 
// the little images that indicate if a field has been completed
// 
// the html5 validations also prevent submission if the form isn't complete

$(document).ready(function(){
  var $signup_form = $('form#signup');
  var wait_time = 2000;
  
  // js email validation
  $signup_form.find('input[name="signup[email]"]').focus(function(){
    $(this).on('keyup', (function(e){
      var $this = $(this);
      if (!$this.val().match(/^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/) && $this.val() !== ""){

        // wait a bit before showing the error
        setTimeout(function(){

          // check to make sure the error is still there
          if (!$this.val().match(/^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/) && $this.val() !== ""){

            // show the error
            $signup_form.find('#email-errors').text("need a real email foo").removeClass('hidden');
          }
        }, wait_time);
      }
      else {
        $signup_form.find('#email-errors').text("").addClass('hidden');
      }
    }));
  });

  // js password validation
  $signup_form.find('input[name="signup[password]"]').focus(function(){
    $(this).on('keyup', (function(e){
      var $this = $(this);
      if (!$this.val().match(/^(?=.*[A-Z])(?=.*[a-z])(?=.*[\d]).{6,}$/) && $this.val() !== ""){
        setTimeout(function(){
          if (!$this.val().match(/^(?=.*[A-Z])(?=.*[a-z])(?=.*[\d]).{6,}$/) && $this.val() !== ""){
            $signup_form.find('#password-errors').text("(6 or more characters with at least one uppercase letter, one lowercase letter, one number)").removeClass('hidden');
          }
        }, wait_time);
      }
      else {
        $signup_form.find('#password-errors').text("").addClass('hidden');
      }
    }));
  });

  // js name validation
  $signup_form.find('input[name="signup[name]"]').focus(function(){
    $(this).on('keyup', (function(e){
      var $this = $(this);
      if (!$this.val().match(/J|j|\w\w+/) && $this.val() !== ""){
        setTimeout(function(){
          if (!$this.val().match(/J|j|\w\w+/) && $this.val() !== ""){
            $signup_form.find('#name-errors').text("One or more letters").removeClass('hidden');
          }
        }, wait_time);
      } 
      else {
        $signup_form.find('#name-errors').text("").addClass('hidden');
      }
    }));
  });

  // remove the keyup listener when the user 'unfocuses' the input
  $signup_form.find('input').blur(function(){
    $(this).unbind('keyup');
    
  });

  // show any previous errors for the input when the user focuses on it
  $signup_form.find('input').focus(function(){
    $(this).prev('.errors').removeClass('hidden');
  });

});