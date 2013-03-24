$(document).ready(function() {

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
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      console.log("ERROR -- " + errorThrown);

    })
  });


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

    })

    .fail(function(jqXHR, textStatus, errorThrown) {
      console.log("ERROR -- " + errorThrown);

    })
  });

});

