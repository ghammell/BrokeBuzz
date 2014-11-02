$(document).ready(function(){
  var lastScrollTop = 0;
  $(window).scroll(function(event){
    var currentTop = $(this).scrollTop();
    position = $('#header').css('background-position-y').replace('px','')
    if (currentTop > lastScrollTop){
      $('#header').css('background-position-y', parseInt(position) - 1 + 'px')
     } else {
      $('#header').css('background-position-y', parseInt(position) + 1 + 'px')
     }
     lastScrollTop = currentTop;
  });
})
