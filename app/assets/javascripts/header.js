$(document).ready(function(){
  headerScrollEnabler('#header', 3)
})

var headerScrollEnabler = function(element, change) {
  window.onscroll = function(){
    position = $(element).css('background-position-y').replace('px','')
    $(element).css('background-position-y', parseInt(position) - change + 'px')
  }
}