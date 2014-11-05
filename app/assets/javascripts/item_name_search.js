$(document).ready(function(){
  bindNameSearchEvent()
})

var bindNameSearchEvent = function() {
  $('body').on('click', '.search_button', function(e){
    e.preventDefault()
    var url = $(this).parents('.new_item').attr('action') + '/name_search'
    var search_term = $(this).siblings('input').val()
    $.ajax({
      url: url,
      method: 'GET',
      data: {search_term: search_term}
    })
    .done(function(){
      console.log('success')
    })
    .fail(function(){
      console.log('fail')
    })
  })
}