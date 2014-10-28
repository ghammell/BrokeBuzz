$(document).ready(function(){
  headerScrollEnabler('#header', '1%')
})

var headerScrollEnabler = function(element, positionChange) {
  window.onscroll = function(){
    position = $(element).css('background-position-y').replace('px','')
    $(element).css('background-position-y', parseInt(position) - 1 + 'px')
    console.log(position)
  }
}