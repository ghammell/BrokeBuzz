$(document).ready(function(){
  bgGenerator = new BackgroundGenerator()
  bgGenerator.positioning('.beer_glass_lg', 'top', 'left')
  bgGenerator.positioning('.beer_glass_mg', 'bottom', 'right')
  bgGenerator.positioning('.beer_glass_dg', 'top', 'right')
})

var BackgroundGenerator = function() {
  this.positioning = function(selector, directionOne, directionTwo){
    var top = Math.floor(Math.random() * 200)
    var left = Math.floor(Math.random() * 200)
    for (i=0; i < $(selector).length; i++) {
      var height = Math.floor(Math.random() * 150)
      $($(selector)[i]).height(height + 'px')
      $($(selector)[i]).css(directionOne, top + 'px')
      $($(selector)[i]).css(directionTwo, left + 'px')
      var left = left + Math.floor(Math.random() * 200 + 150)
      var top = top + Math.floor(Math.random() * 200 + 150)
    }
  $(selector).show()
  }
}

