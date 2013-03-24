$(document).ready(function(){
  $('form').on('submit', function(e){
    e.preventDefault();
    
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize()
    })
    .done(function(data){
      window.location = data.redirect;
    })
    .fail(function(ajaxData){
      var errors = $.parseJSON(ajaxData.responseText).errors;
      console.log('failed ajax request')
      debugger
      $('#errors').text(errors)
    })

  })
});
