$(document).ready(function() {

    $(".fancybox").fancybox();

    function reset_survey_listeners() {
    $('.delete').click(function(e) {
      e.preventDefault();

      $.ajax({
        type: 'get',
        url: this.href,
        data: ''
      })

      .done(function(server_data, textStatus, jqXHR) {
        console.log('Success' + server_data);

        $("#my_surveys").html(server_data);
        reset_survey_listeners();
      })

      .fail(function(jqXHR, textStatus, errorThrown) {
        console.log("ERROR -- " + errorThrown);

      });
    });
  }

  reset_survey_listeners();
});
