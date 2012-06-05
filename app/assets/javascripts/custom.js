$(document).ready(function(){

  $('a.close').click(function(e) {
    e.preventDefault();
    $('.alert-message').hide();
  });

  $('.mainpage td').click(function(){
    document.location=$(this).attr('url');
  });
});