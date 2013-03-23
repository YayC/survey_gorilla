$(document).ready(function() {

   $('.question').submit(function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    $(this).closest('form').find("input[type=text], textarea").val("");

    // console.log(data);
    $.ajax({
      type: this.method,                // Q: what is "this"?
      url: this.action,
      data: data,                       // NOTE: the var 'data' above
    })
    // 3a- this is called when the AJAX call
    //     succeeds
    .done(function(server_data, textStatus, jqXHR) {
      console.log(server_data);
      // 3b- update the DOM with the data returned
      //     by the server

      $(".question_printer_3000").html(server_data);
    })
    // 3c- this is called when the AJAX call
    //     fails
    .fail(function(jqXHR, textStatus, errorThrown) {
      console.log("ERROR -- " + errorThrown);

    })
  });
});
