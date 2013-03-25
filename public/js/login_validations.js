$(document).ready(function(){
  var $login_form = $('form#login');
  var wait_time = 2000;

  $login_form.find('input[name="email"]').focus(function(){
    $(this).on('keyup', function(e){
      var $this = $(this);

      if (!$this.val().match(/^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/)&& $this.val() !== ""){

        // wait a bit before showing the error
        setTimeout(function(){

          // check to make sure the error is still there
          if (!$this.val().match(/^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/)&& $this.val() !== ""){

            // show the error
            $login_form.find('#login-email-errors').text("invalid email, foo").removeClass('hidden');
          }
        }, wait_time);
      }
      else {
        $login_form.find('#login-email-errors').text("").addClass('hidden');
      }

    });
  });

  $login_form.on('submit', function(e){
    e.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize()
    })
    .done(function(data){
      window.location = data;
    })
    .fail(function(ajaxData){
      $login_form.find('#login-errors').text(ajaxData.responseText).removeClass('hidden');
    });
  });

});