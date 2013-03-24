$(document).ready(function() {

  $('.delete').click(function(e) {
    e.preventDefault();
  
    $.ajax({
      type: 'get',                // Q: what is "this"?
      url: this.href,
      data: '',                       // NOTE: the var 'data' above
    })
    // 3a- this is called when the AJAX call
    //     succeeds
    .done(function(server_data, textStatus, jqXHR) {
      console.log('Success' + server_data);
      // 3b- update the DOM with the data returned
      //     by the server

      $("#my_surveys").html(server_data);
    })
    // 3c- this is called when the AJAX call
    //     fails
    .fail(function(jqXHR, textStatus, errorThrown) {
      console.log("ERROR -- " + errorThrown);

    })
  });



  // $('.delete').click(function(e) {
  //   e.preventDefault();
  
  //   $.ajax({
  //     type: 'get',                // Q: what is "this"?
  //     url: this.href,
  //     data: '',                       // NOTE: the var 'data' above
  //   })
  //   // 3a- this is called when the AJAX call
  //   //     succeeds
  //   .done(function(server_data, textStatus, jqXHR) {
  //     console.log('Success' + server_data);
  //     // 3b- update the DOM with the data returned
  //     //     by the server

  //     $("#my_surveys").html(server_data);
  //   })
  //   // 3c- this is called when the AJAX call
  //   //     fails
  //   .fail(function(jqXHR, textStatus, errorThrown) {
  //     console.log("ERROR -- " + errorThrown);

  //   })

  // });

});
