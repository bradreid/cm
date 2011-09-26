// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){

  $('a.close').click(function(e) {
    e.preventDefault();
    $('.alert-message').hide();
  });

  $('.mainpage td').click(function(){
    document.location=$(this).attr('url');
  });
});