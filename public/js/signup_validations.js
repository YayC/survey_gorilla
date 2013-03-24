// all of these validations are also present as html-5 validations on the form; 
// we use main.css (selecting 'required:valid' and 'required:invalid') to add 
// the little images to the fields

$(document).ready(function(){
  var $signup_form = $('form#signup');
  
  // js email validation
  $signup_form.find('input[name="signup[email]"]').focus(function(){
    $(this).on('keyup', (function(e){
      if (!$(this).val().match(/^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/)){
        $signup_form.find('#email-errors').text("need a real email foo").removeClass('hidden');
      } 
      else {
        $signup_form.find('#email-errors').text("").addClass('hidden');
      }
    }));
  });

  // js password validation
  $signup_form.find('input[name="signup[password]"]').focus(function(){
    $(this).on('keyup', (function(e){
      if (!($(this).val().match(/^(?=.*[A-Z])(?=.*[a-z])(?=.*[\d]).{6,}$/))){
        $signup_form.find('#password-errors').text("(6 or more characters with at least one uppercase letter, one lowercase letter, one number)").removeClass('hidden');
      } 
      else {
        $signup_form.find('#password-errors').text("").addClass('hidden');
      }
    }));
  });

  // js name validation
  $signup_form.find('input[name="signup[name]"]').focus(function(){
    $(this).on('keyup', (function(e){
      if (!($(this).val().match(/J|j|\w\w+/))){
          $signup_form.delay(2000).find('#name-errors').text("One or more letters").removeClass('hidden');
      } 
      else {
        $signup_form.find('#name-errors').text("").addClass('hidden');
      }
    }));
  });
  // remove the keyup listener when the user 'unfocuses' the input, and 
  // hide the relevant errors for that field
  $signup_form.find('input').blur(function(){
    $(this).unbind('keyup');
    $(this).prev('.errors').addClass('hidden');
  });

  // show any previous errors for the input when the user focuses on it
  $signup_form.find('input').focus(function(){
    $(this).prev('.errors').removeClass('hidden');
  });


});