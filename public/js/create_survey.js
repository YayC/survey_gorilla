$(document).ready(function() {

  reset_question_listeners();
  reset_photo_listeners();

  $('.question').submit(function(e) {
  e.preventDefault();
  var data = $(this).serialize();
  console.log(data);
  $(this).closest('form').find("input[type=text], textarea").val("");

  $.ajax({
    type: this.method,               
    url: this.action,
    data: data,                      
  })

  .done(function(server_data, textStatus, jqXHR) {
    console.log(server_data);

    $(".question_printer_3000").html(server_data);

    reset_question_listeners();
    reset_photo_listeners();
  })
  .fail(function(jqXHR, textStatus, errorThrown) {
    console.log("ERROR -- " + errorThrown);

  })
});

  function reset_question_listeners() {
    $('.delete_question').click(function(e) {
      e.preventDefault();

       $.ajax({
        type: 'get',                
        url: this.href,
        data: '',                       
      })
      .done(function(server_data, textStatus, jqXHR) {
        console.log("success" + server_data);

        $(".question_printer_3000").html(server_data);
        reset_question_listeners();
      })

      .fail(function(jqXHR, textStatus, errorThrown) {
        console.log("ERROR -- " + errorThrown);

      })
    });
  };     


  function reset_photo_listeners() {
    $('.delete_question_photo').click(function(e) {
      e.preventDefault();

       $.ajax({
        type: 'delete',
        url: this.href,
        data: '',
      })
      .done(function(server_data, textStatus, jqXHR) {
        console.log("success" + server_data);

        $(".question_printer_3000").html(server_data);
        reset_photo_listeners();
      })

      .fail(function(jqXHR, textStatus, errorThrown) {
        console.log("ERROR -- " + errorThrown);

      })
    });
  };     



  $(function() {
      $('#activator').click(function(){
          $('#overlay').fadeIn('fast',function(){
              $('#box').animate({'top':'300px'},1000);
          });
      });
      $('#boxclose').click(function(){
          $('#box').animate({'top':'-600px'},1000,function(){
              $('#overlay').fadeOut('fast');
          });
      });
   
  });


  reset_question_listeners();

});



