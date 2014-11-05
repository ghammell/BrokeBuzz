$(document).ready(function(){
  bindNameSearchEvent()
})

var bindNameSearchEvent = function() {
  $('body').on('click', '.search_button', function(e){
    e.preventDefault()
    var searchButton = $(this)
    var url = $(this).parents('.new_item').attr('action') + '/name_search'
    var search_term = $(this).siblings('input').val()
    var type = $(this).parents().find('#item_category').val()
    $.ajax({
      url: url,
      method: 'GET',
      data: {search_term: search_term, type: type}
    })
    .done(function(data){
      searchButton.before(data)
    })
    .fail(function(){
      console.log('fail')
    })
  })
}