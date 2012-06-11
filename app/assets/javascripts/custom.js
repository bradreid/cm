var anchor = null;
var url = document.location.toString();


function anchor_present(){
  if (anchor){
    return anchor
  }else if (url.match('#')){
    return url.split('#')[1];
  } else{
    return false
  }
}

$(document).ready(function(){
  $('a.close').click(function(e) {
    e.preventDefault();
    $('.alert').hide();
  });
  
  // bootstrap bug.  The first tab does not always load correctly so click the first tab
  $($('.nav.nav-tabs a')[1]).click();
  $($('.nav.nav-tabs a')[0]).click();  
  if(anchor_present()){
    // if the url has an anchor or we've set one in js go to that tab
    $('.nav-tabs a[href=#'+ anchor_present() +']').tab('show') ;
  }
});