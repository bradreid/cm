// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){

  $('ul.tabs a, ul.pills a, .pagination a, .well .btn, .actions .btn, .alert-message .btn, a.close').click(function(e) {
    e.preventDefault();
    $('.alert-message').hide();
  });

  // Dropdown example for topbar nav
  // ===============================

  $("body").bind("click", function (e) {
    $('a.menu').parent("li").removeClass("open");
    $('.menu-dropdown').hide();
  });

  $("a.menu").click(function (e) {
    var li = $(this).parent("li");
    li.toggleClass('open');
    $('.menu-dropdown').show();
    return false;
  });


});