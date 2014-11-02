$(document).ready(function(){
  bgGenerator = new BackgroundGenerator()
  bgGenerator.applyPosition('.beer_glass_lg', 'top', 'left')
  bgGenerator.applyPosition('.beer_glass_mg', 'bottom', 'right')
  bgGenerator.applyPosition('.beer_glass_dg', 'top', 'right')
  bgGenerator.applyPosition('.beer_glass_w', 'bottom', 'left')
})

var BackgroundGenerator = function() {
  this.applyPosition = function(selector, topOrBottom, leftOrRight){
    var dir1 = Math.floor(Math.random() * 200)
    var dir2 = Math.floor(Math.random() * 200)
    for (i=0; i < $(selector).length; i++) {
      bindScroll($(selector)[i], topOrBottom)
      var height = Math.floor(Math.random() * 150)
      $($(selector)[i]).height(height + 'px')
      $($(selector)[i]).css(topOrBottom, dir1 + 'px')
      $($(selector)[i]).css(leftOrRight, dir2 + 'px')
      var dir1 = dir1 + Math.floor(Math.random() * 200 + 150)
      var dir2 = dir2 + Math.floor(Math.random() * 200 + 150)
    }
  $(selector).show()
  }
}

var bindScroll = function(object, direction) {
  var lastScrollTop = 0;
  $(window).scroll(function(event){
    var currentTop = $(this).scrollTop();
    position = $(object).css(direction).replace('px','')
    movement = Math.floor($(object).height() / 25 + 2)
    if (currentTop > lastScrollTop){
      $(object).css(direction, parseInt(position) - movement + 'px')
    } else {
      $(object).css(direction, parseInt(position) + movement + 'px')
    }
    lastScrollTop = currentTop;
  });
}

