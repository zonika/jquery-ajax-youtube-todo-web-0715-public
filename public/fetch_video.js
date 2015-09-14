// document ready means that this script will wait
// for the page to get loaded before running
$(document).ready(function() {

  // user clicks button with cursor
  $("#user-submit").click(function() {
    ajaxCall();
  });

  // user hits enter while on the input field
  $('#text-field').keypress(function(e){
    if(e.which == 13){
      e.preventDefault();
      e.stopPropagation();
      ajaxCall();
    }
  });

  function ajaxCall() {
    var input = $('#text-field').val();
    $.ajax({
      type: "GET",
      url: "/widget",
      data: {search_keyword: input}
    }).done(function(messageFromController){
 	    $('#search-results').html(messageFromController);
 	  });
  }
});
